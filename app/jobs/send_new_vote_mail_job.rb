class SendNewVoteMailJob < ActiveJob::Base
  queue_as :default

  def perform(voter,poll)
    # Do something later
    @voter=voter
    @poll=poll
    Newvotemailer.new_vote_mail(@voter,@poll).deliver_later
  end
end

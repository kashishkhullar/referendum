class SendNewPollEmailJob < ActiveJob::Base
  queue_as :default

  def perform(poll)
    # Do something later
    @poll=poll
    Newpollmailer.new_poll_mail(@poll).deliver_later
  end
end

class EndedPollMailJob < ActiveJob::Base
  queue_as :default

  def perform(poll)
    # Do something later
    @poll=poll
    Pollendedmailer.poll_ended_mail(@poll).deliver_later

    #call this from task
    #EndedPollMailJob.perform_later(@poll)
  end
end

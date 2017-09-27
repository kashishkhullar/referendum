class Pollendedmailer < ApplicationMailer

	def poll_ended_mail poll
		@poll=poll
		mail(to: @poll.voter.email,subject: "Your poll has ended")
	end

end

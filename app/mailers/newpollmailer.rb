class Newpollmailer < ApplicationMailer
	

	def new_poll_mail poll

		@voter_name=poll.voter.username
		@voter_email=poll.voter.email
		@poll=poll
		mail(to: poll.voter.email, subject: "New poll created")

	end

end

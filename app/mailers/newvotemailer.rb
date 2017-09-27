class Newvotemailer < ApplicationMailer

	def new_vote_mail(voter,poll)

		@voter=voter
		@poll=poll
		mail(to: @poll.voter.email,subject: "New vote on your poll")
	end

end

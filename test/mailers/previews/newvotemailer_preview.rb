# Preview all emails at http://localhost:3000/rails/mailers/newvotemailer
class NewvotemailerPreview < ActionMailer::Preview
	def new_vote_mail_preview
  	Newvotemailer.new_vote_mail(Voter.last,Poll.last)
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/pollendedmailer
class PollendedmailerPreview < ActionMailer::Preview
	def poll_ended_mail_preview
		Pollendedmailer.poll_ended_mail(Poll.last)
	end

end

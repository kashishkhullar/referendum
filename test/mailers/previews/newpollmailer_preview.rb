# Preview all emails at http://localhost:3000/rails/mailers/newpollmailer
class NewpollmailerPreview < ActionMailer::Preview
	def new_poll_mail_preview
  	Newpollmailer.new_poll_mail(Poll.last)
  end
end

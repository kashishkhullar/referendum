namespace :endedpolls do
  desc "TODO"
  task checkerandmailer: :environment do

  	Poll.all.each do |poll|
  		if poll.ended==false
  			if Time.now>=poll.end_time
  				poll.ended=true
  				poll.save!
  				#send mail here
  				EndedPollMailJob.set(wait: 5.seconds).perform_later(poll)
          notification = Notification.new
          notification.voter_id=poll.voter_id
          notification.message="Your poll #{poll.title} has ended. Check out the results."
          notification.link="/polls/view/#{poll.id}"
          notification.save!
  			end
  		end
  	end



  end

end

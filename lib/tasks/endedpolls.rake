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
  			end
  		end
  	end



  end

end

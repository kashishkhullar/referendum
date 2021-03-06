class NotificationsController < ApplicationController
	before_action :authenticate_voter!

	def get_notifications

		voter_id=params["voter_id"]

		all_notifications=Notification.where(voter_id: voter_id)

		data={}
		data["notifications"] = all_notifications

		
		return render json: data, status: 200
		


	end

	def read

		notification_id=params["notification_id"]
		notification=Notification.find_by_id(notification_id)
		notification.destroy!
		data={}

		return render json: data ,status: 200

	end

	def read_all
		voter_id=params["voter_id"]
		notifications = Notification.where(voter_id: voter_id) 
		notifications.each do |n|
			n.destroy!
		end
		data={}

	return render json: data ,status: 200
	end




end

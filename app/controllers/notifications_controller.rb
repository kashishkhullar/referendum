class NotificationsController < ApplicationController

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




end

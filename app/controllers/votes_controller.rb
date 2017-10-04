class VotesController < ApplicationController
	before_action :authenticate_voter!,only: [:create]
  def create
  	vote=Vote.create(vote_params)
  	SendNewVoteMailJob.set(wait: 5.seconds).perform_later(current_voter,Poll.find(vote.poll_id))
    notification = Notification.new
          notification.voter_id=Poll.find_by_id(vote.poll_id).voter.id

          notification.message="New vote on your poll: #{Poll.find(vote.poll_id).title}."
          notification.link="/polls/view/#{vote.poll_id}"
          notification.save!
        respond_to do |format|
      format.html{ redirect_to '/home/index' , notice: "Thank You For Voting!"}
      format.js {}
    end
  	

  end

  private
  def vote_params
  	params.require(:vote).permit(:voter_id,:option_id,:poll_id)
  end
end

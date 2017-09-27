class VotesController < ApplicationController
	before_action :authenticate_voter!,only: [:create]
  def create
  	vote=Vote.create(vote_params)
  	SendNewVoteMailJob.set(wait: 5.seconds).perform_later(current_voter,Poll.find(vote.poll_id))
  	redirect_to '/home/index'

  end

  private
  def vote_params
  	params.require(:vote).permit(:voter_id,:option_id,:poll_id)
  end
end

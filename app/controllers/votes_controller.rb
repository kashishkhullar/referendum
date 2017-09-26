class VotesController < ApplicationController
  def create
  	vote=Vote.create(vote_params)
  	redirect_to '/home/index'

  end

  private
  def vote_params
  	params.require(:vote).permit(:voter_id,:option_id,:poll_id)
  end
end

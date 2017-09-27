class HomeController < ApplicationController
	before_action :authenticate_voter!,only: [:profile]
  def index
  	@poll=Poll.new
    @option= Option.new
    @all_polls=Poll.all
    @all_options=Option.all
    @vote=Vote.new
    @all_votes=Vote.all
  end
  def contact
  end

  def about
  end

  def help
  end

  def profile
    @all_polls=Poll.where(voter_id: current_voter.id)
    @all_votes=Vote.all
    @all_options=Option.all
  end

end

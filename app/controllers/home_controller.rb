class HomeController < ApplicationController
	before_action :authenticate_voter!
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
end

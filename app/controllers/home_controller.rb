class HomeController < ApplicationController
	before_action :authenticate_voter!
  def index
  	@poll=Poll.new
    @all_polls=Poll.all
  end
  def contact
  end

  def about
  end

  def help
  end
end

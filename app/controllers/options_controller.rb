class OptionsController < ApplicationController
  before_action :authenticate_voter!
  def add
  	respond_to do |format|
  		format.html{redirect_to '/home/index'}
  		format.js{}
  	end
  	
  end

  private
  def option_params
  	params.require(:option).permit(:name,:poll_id)
  end
end

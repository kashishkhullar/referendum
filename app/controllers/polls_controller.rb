class PollsController < ApplicationController
  def create
  	poll = Poll.new(poll_params)
  	poll.voter_id=current_voter.id
  	days=params[:days].to_i
  	hours=params[:hours].to_i
  	time = (days*24*60*60 + hours*60*60)
  	
  	poll.time_limit=time
  	poll.end_time=Time.now + time
  	poll.save!
  	redirect_to '/home/index'
  end

  def edit
  end

  def destroy
  end

  def view
  end

  private
  def poll_params
  	params.require(:poll).permit(:title,:content,:private,:time_limit,:days,:hours)
  end
end

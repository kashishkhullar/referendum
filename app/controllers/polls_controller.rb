class PollsController < ApplicationController
  def create
  	poll = Poll.create(poll_params)
  	poll.voter_id=current_voter.id
  	days=params[:days].to_i
  	hours=params[:hours].to_i
  	time = (days*24*60*60 + hours*60*60)
  	
  	poll.time_limit=time
  	poll.end_time=Time.now + time
  	poll.save!
  	# params['poll']['poll_id']=poll.id
  	#poll.create_options params,poll
  	if params['poll'][:option_1]!=nil && params['poll'][:option_1]!=""
  		puts "here option one is made"
  		option=Option.new
  		option.name=params['poll'][:option_1]
  		option.poll_id=poll.id
  		option.save!
  	end
  	if !params['poll'][:option_2].nil? && params['poll'][:option_2]!=""
  		option=Option.new
  		option.name=params['poll'][:option_2]
  		option.poll_id=poll.id
  		option.save!
  	end
  	if !params['poll'][:option_3].nil? && params['poll'][:option_3]!=""
  		option=Option.new
  		option.name=params['poll'][:option_3]
  		option.poll_id=poll.id
  		option.save!
  	end
  	if !params['poll'][:option_4].nil? && params['poll'][:option_4]!=""
  		option=Option.new
  		option.name=params['poll'][:option_4]
  		option.poll_id=poll.id
  		option.save!
  	end
  	if !params['poll'][:option_5].nil? && params['poll'][:option_5]!=""
  		option=Option.new
  		option.name=params['poll'][:option_5]
  		option.poll_id=poll.id
  		option.save!
  	end
  	

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
  	params.require(:poll).permit(:title,:content,:private,:time_limit,:days,:hours,:option_1,:option_2,:option_3,:option_4,:option_5)
  end
end

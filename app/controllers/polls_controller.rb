class PollsController < ApplicationController
  before_action :authenticate_voter!,only: [:create,:destroy]
  def create
  	@poll = Poll.create(poll_params)
  	@poll.voter_id=current_voter.id
  	days=poll_params[:days]
  	hours=poll_params[:hours]
  	time = (days.to_i*24*60*60 + hours.to_i*60*60).to_i
  	t=Time.now.to_i
    puts "here"
    puts  days
    puts hours
    puts time
    puts t
  	# @poll.time_limit=
  	@poll.end_time= Time.at(t + time)
  	@poll.save!
  	# params['poll']['poll_id']=poll.id
  	@poll.create_options poll_params
    #Newpollmailer.new_poll_mail(@poll)
    SendNewPollEmailJob.set(wait: 5.seconds).perform_later(@poll)
  	# if params['poll'][:option_1]!=nil && params['poll'][:option_1]!=""
  	# 	puts "here option one is made"
  	# 	option=Option.new
  	# 	option.name=params['poll'][:option_1]
  	# 	option.poll_id=poll.id
  	# 	option.save!
  	# end
  	# if !params['poll'][:option_2].nil? && params['poll'][:option_2]!=""
  	# 	option=Option.new
  	# 	option.name=params['poll'][:option_2]
  	# 	option.poll_id=poll.id
  	# 	option.save!
  	# end
  	# if !params['poll'][:option_3].nil? && params['poll'][:option_3]!=""
  	# 	option=Option.new
  	# 	option.name=params['poll'][:option_3]
  	# 	option.poll_id=poll.id
  	# 	option.save!
  	# end
  	# if !params['poll'][:option_4].nil? && params['poll'][:option_4]!=""
  	# 	option=Option.new
  	# 	option.name=params['poll'][:option_4]
  	# 	option.poll_id=poll.id
  	# 	option.save!
  	# end
  	# if !params['poll'][:option_5].nil? && params['poll'][:option_5]!=""
  	# 	option=Option.new
  	# 	option.name=params['poll'][:option_5]
  	# 	option.poll_id=poll.id
  	# 	option.save!
  	# end
    respond_to do |format|
      format.html{ redirect_to '/home/index' , notice: "Poll was successfully created. Check your profile to see your poll."}
      format.js {}
    end
  end

  def edit
  end

  def destroy
    poll_id=params[:poll_id]
    Poll.find_by(id:poll_id).destroy!
    redirect_to '/home/profile',notice: "Poll was successfully deleted."
  end

  def view
        @poll=Poll.find_by_id(params[:poll_id])
        @option= Option.new
        @all_polls=Poll.all
        @all_options=Option.all
        @vote=Vote.new
        @all_votes=Vote.all

  end

  private
  def poll_params
  	params.require(:poll).permit(:title,:content,:private,:time_limit,:days,:hours,:option_1,:option_2,:option_3,:option_4,:option_5)
  end
end

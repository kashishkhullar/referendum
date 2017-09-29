class HomeController < ApplicationController

	before_action :authenticate_voter!,only: [:profile]
  #before_action :getTop!,:only[:index]
  autocomplete :poll,:title ,:full=>true
  def index
    # @search_result_polls=nil
    # # puts "here"
    # puts @search
    if params[:search].nil?
        @poll=Poll.new
        @option= Option.new
        @all_polls=Poll.all
        @all_options=Option.all
        @vote=Vote.new
        @all_votes=Vote.all
        @top=getTop.reverse.take(10)
        @latest=getLatest.take(10)
    else
      @search=Poll.search(params[:search]).where(private: false).order(created_at: :desc)
    end

    
  end
  def contact
  end

  def about
  end

  def help
  end
@search=nil
  def index_post

    @search = 
    

    redirect_to '/home/index'

  end


  def profile
    @ended_polls=Poll.includes(:votes,:options).where(voter_id: current_voter.id,ended: true)
    @active_polls=Poll.includes(:votes,:options).where(voter_id: current_voter.id,ended: false)
    #@all_votes=Vote.all
    #@all_options=Option.all
  end

  private

  def getTop
    
    @all_polls.sort_by{|u| u.votes.length}
  end

  def getLatest
    @all_polls.order(created_at: :asc)
  end

end

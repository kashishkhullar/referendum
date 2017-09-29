class Poll < ActiveRecord::Base
  belongs_to :voter
  has_many :options, dependent: :delete_all
  has_many :votes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  validates :hours, :inclusion => { :in => 0..23 }

  default_scope {where(private: false)}


  def create_options poll_params
  	puts "here"
  	puts "here again"
  	puts poll_params
  	if poll_params[:option_1]!=nil && poll_params[:option_1]!=""
  		puts "here option one is made"
  		option=Option.new
  		option.name=poll_params[:option_1]
  		option.poll_id=self.id
  		option.save!
  	end
  	if !poll_params[:option_2].nil? && poll_params[:option_2]!=""
  		option=Option.new
  		option.name=poll_params[:option_2]
  		option.poll_id=self.id
  		option.save!
  	end
  	if !poll_params[:option_3].nil? && poll_params[:option_3]!=""
  		option=Option.new
  		option.name=poll_params[:option_3]
  		option.poll_id=self.id
  		option.save!
  	end
  	if !poll_params[:option_4].nil? && poll_params[:option_4]!=""
  		option=Option.new
  		option.name=poll_params[:option_4]
  		option.poll_id=self.id
  		option.save!
  	end
  	if !poll_params[:option_5].nil? && poll_params[:option_5]!=""
  		option=Option.new
  		option.name=poll_params[:option_5]
  		option.poll_id=self.id
  		option.save!
  	end

  end

  def self.search(search)
  where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end



end

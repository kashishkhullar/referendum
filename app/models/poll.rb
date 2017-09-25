class Poll < ActiveRecord::Base
  belongs_to :voter
  validates :hours, :inclusion => { :in => 0..23 }
end

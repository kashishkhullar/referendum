class Poll < ActiveRecord::Base
  belongs_to :voter
  has_many :options, dependent: :delete_all
  validates :title, presence: true
  validates :content, presence: true

  validates :hours, :inclusion => { :in => 0..23 }


end

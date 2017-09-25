class Voter < ActiveRecord::Base
  validates :username, presence: true
  validates :ip_address,presence: true,uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  has_many :polls,:foreign_key => :voter_id,dependent: :destroy

end

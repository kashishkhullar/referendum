class Vote < ActiveRecord::Base
  belongs_to :poll
  belongs_to :voter
  belongs_to :option
end

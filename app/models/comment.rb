class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :producer # take out 
  belongs_to :track
end

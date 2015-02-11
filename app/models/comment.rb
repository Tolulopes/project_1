class Comment < ActiveRecord::Base
  belongs_to :producer
  belongs_to :user
end

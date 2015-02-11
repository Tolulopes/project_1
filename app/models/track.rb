class Track < ActiveRecord::Base
  mount_uploader :song, SongUploader
  belongs_to :user
  has_many :comments
end

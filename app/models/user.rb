class User < ActiveRecord::Base
  has_many :comments, through: :tracks
  has_many :tracks

  mount_uploader :image, ImageUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end  

  def producer?
    role == 'producer'
  end
end

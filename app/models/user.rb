class User < ActiveRecord::Base
  has_many :comments, through: :tracks
  has_many :tracks

  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end  

  def producer?
    role == 'producer'
  end

  # def user?
  #   role == 'default'
    



end

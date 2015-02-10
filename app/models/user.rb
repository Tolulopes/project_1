class User < ActiveRecord::Base
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

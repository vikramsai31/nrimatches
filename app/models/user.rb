class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessible :email, :password, :password_confirmation, :remember_me,:firstname,:lastname,:country_id,:state_id
   belongs_to :country
   has_one :member
   
end

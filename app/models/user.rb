class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, presence: {message: "Username is required"}, uniqueness: {message: "That username is already taken"}

   has_many(:calories, :class_name => "Calorie", :foreign_key => "user_id")

   def email_required?
      false
   end

   def email_changed?
      false
   end
end

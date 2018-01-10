class Calorie < ApplicationRecord
   belongs_to(:user, :class_name => "User", :foreign_key => "user_id")

   validates :date, uniqueness: true
end

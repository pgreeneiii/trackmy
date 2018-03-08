class Calorie < ApplicationRecord
   belongs_to(:user, :class_name => "User", :foreign_key => "user_id")

   validates :date, uniqueness: true
   validates :weight, presence: true
   validates :consumed, presence: true

   def calculate_tdee(height, age, activity)
      bmr = 66 + (13.7*self.weight*0.453592) + (5*height*2.54) - (6.8*age)
      tdee = bmr * activity
      return tdee
   end
end

class Guest < ActiveRecord::Base
  attr_accessible :arriving, :arriving_day, :departing, :departing_day, :email, :friday_dinner, :mobile, :name, :nb_castle_nights, :nb_children, :nb_people, :nogo, :saturday_lunch, :sunday_lunch
end

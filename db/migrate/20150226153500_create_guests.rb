class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :arriving
      t.string :departing
      t.string :arriving_day
      t.string :departing_day
      t.string :nb_castle_nights
      t.boolean :friday_dinner
      t.boolean :saturday_lunch
      t.boolean :sunday_lunch
      t.integer :nb_people
      t.integer :nb_children
      t.boolean :nogo
      t.integer :nb_nights

      t.timestamps
    end
  end
end

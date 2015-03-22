class AddSundayDinnerToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :sunday_dinner, :boolean
    add_index :guests, :sunday_dinner
  end
end

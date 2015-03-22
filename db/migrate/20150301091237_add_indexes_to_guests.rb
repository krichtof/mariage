class AddIndexesToGuests < ActiveRecord::Migration
  def change
    add_index :guests, :name
    add_index :guests, :email
    add_index :guests, :mobile
  end
end

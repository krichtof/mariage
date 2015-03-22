class AddTokenToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :token, :string
    add_index :guests, :token
  end
end

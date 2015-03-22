class AddRemarkToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :remark, :string
  end
end

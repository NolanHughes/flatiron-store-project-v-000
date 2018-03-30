class ChangeCartTableToCarts < ActiveRecord::Migration
  def change
    rename_table :cart, :carts
  end
end

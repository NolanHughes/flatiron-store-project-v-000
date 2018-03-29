class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      #Maybe these instead
      # t.integer :cart_id
      # t.integer :item_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end

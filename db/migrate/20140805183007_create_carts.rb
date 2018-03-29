class CreateCarts < ActiveRecord::Migration
  def change
    create_table :cart do |t|
      t.string :status, default: "pending"

      t.timestamps null: false
    end
  end
end

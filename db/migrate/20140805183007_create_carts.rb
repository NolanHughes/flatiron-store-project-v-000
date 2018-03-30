class CreateCarts < ActiveRecord::Migration
  def change
    create_table :cart do |t|
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

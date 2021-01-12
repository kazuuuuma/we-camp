class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.timestamps
      t.text :text
      t.integer :place_id, null: false
      t.integer :toilet_id,null: false
      t.integer :fire_id,  null: false
      t.integer :river_id, null: false
      t.integer :gomi_id,  null: false
      t.integer :water_id, null: false
      t.string :price,     null: false
      t.references :user,  foreign_key: true
    end
  end
end

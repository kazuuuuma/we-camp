class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :campsite,  null: false
      t.text :text
      t.integer :place_id, null: false
      t.integer :toilet_id,null: false
      t.integer :fire_id,  null: false
      t.integer :river_id, null: false
      t.integer :gomi_id,  null: false
      t.integer :water_id, null: false
      t.string :price,     null: false
      t.references :user,  foreign_key: true
      t.integer :favorite_count, null: false, default: 0
    end
  end
end

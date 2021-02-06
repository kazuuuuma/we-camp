class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment, null: false
      t.string :visit_day
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end

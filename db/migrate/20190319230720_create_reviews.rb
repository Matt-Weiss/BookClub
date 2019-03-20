class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.integer :rating
      t.string :review_headline
      t.string :review_body

      t.timestamps
    end
  end
end

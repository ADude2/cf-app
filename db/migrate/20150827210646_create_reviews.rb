class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :gym, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end

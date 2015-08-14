class CreateGymListings < ActiveRecord::Migration
  def change
    create_table :gym_listings do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.float :lat
      t.float :long
      t.integer :unique_id
      t.text :raw_json

      t.timestamps null: false
    end
  end
end

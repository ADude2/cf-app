class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name, index: true
      t.string :website
      t.string :address
      t.string :city, index: true
      t.string :state, index: true
      t.string :zip
      t.string :country
      t.float :lat
      t.float :long
      t.integer :unique_id, index: true

      t.timestamps null: false
    end
  end
end

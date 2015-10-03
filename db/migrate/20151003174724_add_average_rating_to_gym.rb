class AddAverageRatingToGym < ActiveRecord::Migration
  def change
    add_column :gyms, :average_rating, :float
    add_index :gyms, :average_rating
  end
end

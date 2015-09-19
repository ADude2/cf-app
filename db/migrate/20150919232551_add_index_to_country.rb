class AddIndexToCountry < ActiveRecord::Migration
  def change
    add_index :gyms, :country
  end
end

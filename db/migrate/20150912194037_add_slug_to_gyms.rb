class AddSlugToGyms < ActiveRecord::Migration
  def change
    add_column :gyms, :slug, :string
    add_index :gyms, :slug
  end
end

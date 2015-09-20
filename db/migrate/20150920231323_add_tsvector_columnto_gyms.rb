class AddTsvectorColumntoGyms < ActiveRecord::Migration
  def up
    add_column :gyms, :tsv, :tsvector
    add_index :gyms, :tsv, using: "gin"

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON gyms FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', name, city, state, country
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE gyms SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON gyms
    SQL

    remove_index :gyms, :tsv
    remove_column :gyms, :tsv
  end
end
class DropTablesCategories < ActiveRecord::Migration[6.0]
  def change
  	drop_table :tables_categories
  end
end

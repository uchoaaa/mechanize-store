class AddSlugToMechanizeStoreProducts < ActiveRecord::Migration
  def change
    add_column :mechanize_store_products, :slug, :string, index: true
  end
end

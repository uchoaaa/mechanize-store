class AddSlugToProductCategory < ActiveRecord::Migration
  def change
    add_column :mechanize_store_product_categories, :slug, :string, index: true
  end
end

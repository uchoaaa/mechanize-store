class AddProductSectionIdToMechanizeStoreProductCategory < ActiveRecord::Migration
  def change
    add_column :mechanize_store_product_categories, :product_section_id, :integer, index: true
  end
end

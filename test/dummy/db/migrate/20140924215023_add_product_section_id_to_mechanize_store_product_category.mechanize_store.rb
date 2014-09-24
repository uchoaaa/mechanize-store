# This migration comes from mechanize_store (originally 20140606130912)
class AddProductSectionIdToMechanizeStoreProductCategory < ActiveRecord::Migration
  def change
    add_column :mechanize_store_product_categories, :product_section_id, :integer, index: true
  end
end

# This migration comes from mechanize_store (originally 20140606124916)
class AddSlugToProductSection < ActiveRecord::Migration
  def change
    add_column :mechanize_store_product_sections, :slug, :string, index: true
  end
end

class AddSlugToProductSection < ActiveRecord::Migration
  def change
    add_column :mechanize_store_product_sections, :slug, :string, index: true
  end
end

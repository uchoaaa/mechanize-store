# This migration comes from mechanize_store (originally 20140402192058)
class CreateMechanizeStoreProductCategories < ActiveRecord::Migration
  def change
    create_table :mechanize_store_product_categories do |t|
      t.string :name
      t.references :product_category

      t.timestamps
    end
  end
end

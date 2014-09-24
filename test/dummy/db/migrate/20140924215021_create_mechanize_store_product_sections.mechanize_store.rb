# This migration comes from mechanize_store (originally 20140606123953)
class CreateMechanizeStoreProductSections < ActiveRecord::Migration
  def change
    create_table :mechanize_store_product_sections do |t|
      t.string :name

      t.timestamps
    end
  end
end

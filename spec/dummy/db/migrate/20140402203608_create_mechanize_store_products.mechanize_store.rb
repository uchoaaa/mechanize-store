# This migration comes from mechanize_store (originally 20140402140832)
class CreateMechanizeStoreProducts < ActiveRecord::Migration
  def change
    create_table :mechanize_store_products do |t|
      t.string :name
      t.text :description
      t.string :short_description
      t.float :price
      t.float :weight
      t.float :lenght
      t.float :height
      t.references :product_category, index: true

      t.timestamps
    end
  end
end

# This migration comes from mechanize_store (originally 20140402140942)
class CreateMechanizeStoreProductPhotos < ActiveRecord::Migration
  def change
    create_table :mechanize_store_product_photos do |t|
      t.attachment :file
      t.references :product, index: true

      t.timestamps
    end
  end
end

class CreateStoreProductPhotos < ActiveRecord::Migration
  def change
    create_table :store_product_photos do |t|
      t.attachment :file
      t.references :product, index: true

      t.timestamps
    end
  end
end

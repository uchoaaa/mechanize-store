class CreateStoreStores < ActiveRecord::Migration
  def change
    create_table :store_stores do |t|
      t.string :name
      t.string :key
      t.string :url
      t.string :zipcode

      t.timestamps
    end
  end
end

# This migration comes from mechanize_store (originally 20140402141340)
class CreateMechanizeStoreStores < ActiveRecord::Migration
  def change
    create_table :mechanize_store_mechanize_stores do |t|
      t.string :name
      t.string :key
      t.string :url
      t.string :zipcode

      t.timestamps
    end
  end
end

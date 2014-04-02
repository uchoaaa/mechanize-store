# This migration comes from store (originally 20140401203200)
class CreateStoreFreights < ActiveRecord::Migration
  def change
    create_table :store_freights do |t|
      t.float :value
      t.string :service
      t.references :order, index: true
      t.string :zipcode

      t.timestamps
    end
  end
end

# This migration comes from mechanize_store (originally 20140401203200)
class CreateMechanizeStoreFreights < ActiveRecord::Migration
  def change
    create_table :mechanize_store_freights do |t|
      t.float :value
      t.string :service
      t.references :order, index: true
      t.string :zipcode

      t.timestamps
    end
  end
end

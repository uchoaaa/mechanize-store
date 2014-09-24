# This migration comes from mechanize_store (originally 20140402153139)
class CreateMechanizeStoreOrders < ActiveRecord::Migration
  def change
    create_table :mechanize_store_orders do |t|
      t.references :order_status, index: true
      t.references :store, index: true
      t.datetime :delivery_date

      t.timestamps
    end
  end
end

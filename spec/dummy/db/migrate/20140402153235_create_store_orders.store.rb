# This migration comes from store (originally 20140402153139)
class CreateStoreOrders < ActiveRecord::Migration
  def change
    create_table :store_orders do |t|
      t.references :order_status, index: true
      t.references :store, index: true
      t.datetime :delivery_date

      t.timestamps
    end
  end
end

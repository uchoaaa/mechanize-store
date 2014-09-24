# This migration comes from mechanize_store (originally 20140717182327)
class AddColorAndSizeToMechanizeStoreOrderItem < ActiveRecord::Migration
  def change
    add_column :mechanize_store_order_items, :color, :string
    add_column :mechanize_store_order_items, :size, :string
  end
end

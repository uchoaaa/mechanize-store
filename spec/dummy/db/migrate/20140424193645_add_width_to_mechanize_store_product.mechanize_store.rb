# This migration comes from mechanize_store (originally 20140407193412)
# This migration comes from mechanize_store (originally 20140407193412)
class AddWidthToMechanizeStoreProduct < ActiveRecord::Migration
  def change
    add_column :mechanize_store_products, :width, :float
  end
end
# This migration comes from mechanize_store (originally 20140417200520)
class AddTimeToFreight < ActiveRecord::Migration
  def change
    add_column :mechanize_store_freights, :delivery_time, :integer
  end
end

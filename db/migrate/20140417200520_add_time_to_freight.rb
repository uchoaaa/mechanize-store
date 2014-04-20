class AddTimeToFreight < ActiveRecord::Migration
  def change
    add_column :mechanize_store_freights, :delivery_time, :integer
  end
end

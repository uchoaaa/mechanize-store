class CreateStoreOrderStatuses < ActiveRecord::Migration
  def change
    create_table :store_order_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

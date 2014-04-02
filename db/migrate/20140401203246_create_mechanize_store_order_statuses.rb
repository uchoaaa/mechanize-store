class CreateMechanizeStoreOrderStatuses < ActiveRecord::Migration
  def change
    create_table :mechanize_store_order_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

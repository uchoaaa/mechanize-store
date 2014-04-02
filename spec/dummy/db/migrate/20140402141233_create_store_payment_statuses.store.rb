# This migration comes from store (originally 20140402140318)
class CreateStorePaymentStatuses < ActiveRecord::Migration
  def change
    create_table :store_payment_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

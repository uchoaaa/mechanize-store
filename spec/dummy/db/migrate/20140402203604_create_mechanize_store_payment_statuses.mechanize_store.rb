# This migration comes from mechanize_store (originally 20140402140318)
class CreateMechanizeStorePaymentStatuses < ActiveRecord::Migration
  def change
    create_table :mechanize_store_payment_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

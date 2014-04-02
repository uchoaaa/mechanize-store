# This migration comes from store (originally 20140402140539)
class CreateStorePayments < ActiveRecord::Migration
  def change
    create_table :store_payments do |t|
      t.integer :payable_id
      t.string :payable_type
      t.references :payment_status, index: true
      t.float :value
      t.float :paid_value
      t.datetime :paid_in
      t.integer :plot
      t.references :flag, index: true

      t.timestamps
    end
  end
end

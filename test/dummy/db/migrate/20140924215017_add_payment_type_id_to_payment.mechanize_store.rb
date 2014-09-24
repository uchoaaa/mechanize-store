# This migration comes from mechanize_store (originally 20140416123100)
class AddPaymentTypeIdToPayment < ActiveRecord::Migration
  def change
    add_column :mechanize_store_payments, :payment_type_id, :integer
    add_index :mechanize_store_payments, :payment_type_id
  end
end

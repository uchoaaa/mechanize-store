class AddPaymentTypeIdToPayment < ActiveRecord::Migration
  def change
    add_column :mechanize_store_payments, :payment_type_id, :integer
    add_index :mechanize_store_payments, :payment_type_id
  end
end

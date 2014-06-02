class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :mechanize_store_orders, :order_status_id, :order_status
    rename_column :mechanize_store_payments, :payment_type_id, :payment_type
    rename_column :mechanize_store_payments, :payment_status_id, :payment_status
  end
end

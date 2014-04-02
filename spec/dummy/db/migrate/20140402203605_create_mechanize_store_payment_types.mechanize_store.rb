# This migration comes from mechanize_store (originally 20140402140325)
class CreateMechanizeStorePaymentTypes < ActiveRecord::Migration
  def change
    create_table :mechanize_store_payment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

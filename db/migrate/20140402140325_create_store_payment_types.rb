class CreateStorePaymentTypes < ActiveRecord::Migration
  def change
    create_table :store_payment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

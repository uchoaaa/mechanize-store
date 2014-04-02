class CreateMechanizeStoreFlags < ActiveRecord::Migration
  def change
    create_table :mechanize_store_flags do |t|
      t.string :name

      t.timestamps
    end
  end
end

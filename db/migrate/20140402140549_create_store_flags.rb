class CreateStoreFlags < ActiveRecord::Migration
  def change
    create_table :store_flags do |t|
      t.string :name

      t.timestamps
    end
  end
end

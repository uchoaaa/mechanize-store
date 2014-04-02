# This migration comes from store (originally 20140402140549)
class CreateStoreFlags < ActiveRecord::Migration
  def change
    create_table :store_flags do |t|
      t.string :name

      t.timestamps
    end
  end
end

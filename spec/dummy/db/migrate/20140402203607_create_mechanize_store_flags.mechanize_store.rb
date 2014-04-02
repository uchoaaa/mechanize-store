# This migration comes from mechanize_store (originally 20140402140549)
class CreateMechanizeStoreFlags < ActiveRecord::Migration
  def change
    create_table :mechanize_store_flags do |t|
      t.string :name

      t.timestamps
    end
  end
end

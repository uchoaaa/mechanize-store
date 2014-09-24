# This migration comes from mechanize_store (originally 20140721124512)
class AddSlugToMechanizeStoreProducts < ActiveRecord::Migration
  def change
    add_column :mechanize_store_products, :slug, :string, index: true
  end
end

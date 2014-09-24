# This migration comes from mechanize_store (originally 20140806143246)
class AddFreightTypeToFreight < ActiveRecord::Migration
    def change
        add_column :mechanize_store_freights, :freight_type, :integer
    end
end

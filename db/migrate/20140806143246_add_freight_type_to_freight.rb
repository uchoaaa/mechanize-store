class AddFreightTypeToFreight < ActiveRecord::Migration
    def change
        add_column :mechanize_store_freights, :freight_type, :integer
    end
end

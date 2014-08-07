module MechanizeStore
    class Freight < ActiveRecord::Base
        FREIGHT_TYPES = {
            1 => :pick_up,
            2 => :delivery
        }

        belongs_to :order
        validates :service, :value, :zipcode, :delivery_time, presence: true, if: Proc.new{|f| f.freight_type.to_i == FREIGHT_TYPES.invert[:delivery] } 
    end
end

module MechanizeStore
    class Payment < ActiveRecord::Base
        belongs_to :order
        belongs_to :payment_status
        belongs_to :payment_type
        belongs_to :flag

        validates_presence_of :payment_type_id
    end
end

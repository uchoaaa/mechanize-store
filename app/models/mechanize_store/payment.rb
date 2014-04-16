module MechanizeStore
    class Payment < ActiveRecord::Base
        belongs_to :order
        belongs_to :payment_status
        belongs_to :payment_type
        belongs_to :flag
    end
end

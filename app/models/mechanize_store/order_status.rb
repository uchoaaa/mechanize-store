module MechanizeStore
    class OrderStatus < ActiveRecord::Base
        validates :name, presence: true

        ACCOMPLISHED = 1
        SUBMITTED = 2
        DELIVERED = 3
        CANCELED = 4
    end
end

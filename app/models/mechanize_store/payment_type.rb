module MechanizeStore
    class PaymentType < ActiveRecord::Base
        validates :name, presence: true
        CREDIT_CARD = 2
        BILLET = 1
    end
end

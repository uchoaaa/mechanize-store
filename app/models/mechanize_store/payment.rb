module MechanizeStore
    class Payment < ActiveRecord::Base
        belongs_to :order
        belongs_to :payment_status
        belongs_to :payment_type
        belongs_to :flag

        validates :payment_type_id, :flag_id, presence: true

        before_create :before_create

        def before_create
            self.payment_status_id = PaymentStatus::AWAITING
        end
    end
end

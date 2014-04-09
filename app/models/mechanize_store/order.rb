module MechanizeStore
  class Order < ActiveRecord::Base
    belongs_to :order_status
    belongs_to :mechanize_store

    has_one :payment, as: :payable
    accepts_nested_attributes_for :payment, :allow_destroy => false

    has_one :freight, dependent: :destroy
    accepts_nested_attributes_for :freight, :allow_destroy => true

    has_many :order_items

    before_create :set_defaults
    after_create :after_create

    def set_defaults
        self.order_status_id = OrderStatus::ACCOMPLISHED
    end

    def after_create
        p = self.payment
        p.value = self.total_value
        p.value += self.freight.value if self.freight
        p.save!
    end

    def confirm!
        Order.transaction do
            unless self.generated?           
                paid_in = self.payment.paid_in
                self.generated_at = paid_in ||= DateTime.now
                self.save
            end
        end
    end

    def generated?
        return true if self.generated_at
    end

    def total_value
        self.order_items.collect{|o| o.total }.inject(0){|a, b| a+b }
    end
  end
end

module MechanizeStore
  class Order < ActiveRecord::Base

    STATUSES = {
        1 => :accomplished,
        2 => :submited, 
        3 => :delivered,
        4 => :canceled
    }

    belongs_to :store

    has_one :payment
    accepts_nested_attributes_for :payment, :allow_destroy => false

    has_one :freight, dependent: :destroy
    accepts_nested_attributes_for :freight, :allow_destroy => true

    has_many :order_items
    accepts_nested_attributes_for :order_items, :allow_destroy => false

    before_create :set_defaults
    after_create :after_create

    validates :payment, :freight, presence: true

    def order_status_str
        return I18n.t(STATUSES[self.order_status], scope: "order_statuses")
    end

    def self.statuses_collection
        statuses_collection = []

        STATUSES.each_pair do |key, value|
            statuses_collection << [I18n.t(value, scope: "order_statuses"), key]
        end

        return statuses_collection
    end

    def set_defaults
        self.order_status = STATUSES.invert[:submited]
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

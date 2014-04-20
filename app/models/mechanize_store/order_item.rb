module MechanizeStore
  class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    def total
        self.quantity.to_f * self.price.to_f
    end
  end
end

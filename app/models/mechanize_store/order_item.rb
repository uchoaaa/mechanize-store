module MechanizeStore
  class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    validates :quantity, :price, :product_id, presence: true

    def total
        self.quantity.to_f * self.price.to_f
    end
  end
end

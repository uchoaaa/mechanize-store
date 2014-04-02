module MechanizeStore
  class Order < ActiveRecord::Base
    belongs_to :order_status
    belongs_to :mechanize_store

    has_one :payment, as: :payable
  end
end

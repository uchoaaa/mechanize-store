module MechanizeStore
  class Freight < ActiveRecord::Base
    belongs_to :order

    validates :service, :value, :zipcode, :delivery_time, presence: true
  end
end

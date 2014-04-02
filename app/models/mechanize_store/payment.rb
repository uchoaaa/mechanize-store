module MechanizeStore
  class Payment < ActiveRecord::Base
    belongs_to :payment_status
    belongs_to :flag
  end
end

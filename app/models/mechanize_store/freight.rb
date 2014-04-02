module MechanizeStore
  class Freight < ActiveRecord::Base
    belongs_to :order
  end
end

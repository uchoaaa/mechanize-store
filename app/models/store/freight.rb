module Store
  class Freight < ActiveRecord::Base
    belongs_to :order
  end
end

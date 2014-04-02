module MechanizeStore
  class ProductPhoto < ActiveRecord::Base
    belongs_to :product
  end
end

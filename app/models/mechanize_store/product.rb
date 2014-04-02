module MechanizeStore
  class Product < ActiveRecord::Base
    belongs_to :product_category
  end
end

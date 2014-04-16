module MechanizeStore
  class ProductCategory < ActiveRecord::Base
    belongs_to :product_category, class_name: MechanizeStore::ProductCategory
  end
end

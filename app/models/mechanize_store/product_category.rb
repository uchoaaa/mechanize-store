module MechanizeStore
  class ProductCategory < ActiveRecord::Base
    belongs_to :product_category, class_name: MechanizeStore::ProductCategory

    validates :name, presence: true
  end
end

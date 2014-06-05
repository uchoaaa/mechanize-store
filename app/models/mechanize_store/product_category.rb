module MechanizeStore
  class ProductCategory < ActiveRecord::Base
    belongs_to :product_category, class_name: MechanizeStore::ProductCategory
    has_many :product_categories

    validates :name, presence: true

    scope :orphans, -> { where("product_category_id is NULL") }
  end
end

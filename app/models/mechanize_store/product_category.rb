module MechanizeStore
  class ProductCategory < ActiveRecord::Base
    belongs_to :product_category, class_name: MechanizeStore::ProductCategory
    has_many :product_categories

    validates :name, presence: true

    scope :orphans, -> { where("product_category_id is NULL") }

    after_create :create_slug
    before_update :set_defaults

    def set_defaults
      self.slug = self.name.parameterize
    end

    def create_slug
      self.update_attributes(:slug => self.name.parameterize)
    end
  end
end

module MechanizeStore
  class ProductCategory < ActiveRecord::Base
    belongs_to :product_section
    
    has_many :products

    validates :name, presence: true

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

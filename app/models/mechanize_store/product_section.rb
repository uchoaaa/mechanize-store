module MechanizeStore
    class ProductSection < ActiveRecord::Base
        has_many :product_categories

        has_many :products, through: :product_categories

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

module MechanizeStore
    class Product < ActiveRecord::Base
        belongs_to :product_category, class_name: MechanizeStore::ProductCategory
        has_many :product_photos, class_name: MechanizeStore::ProductPhoto

        after_create :create_slug
        before_update :set_defaults

        validates :name, :price, :description, :short_description, :weight, :length, :width, :height, presence: true

        def first_photo
            return nil if self.product_photos.empty?
            return self.product_photos.first
        end

        def set_defaults
          self.slug = "#{self.id}-#{self.name.parameterize}"
        end

        def create_slug
          self.update_attributes(:slug => "#{self.id}-#{self.name.parameterize}")
        end
    end
end

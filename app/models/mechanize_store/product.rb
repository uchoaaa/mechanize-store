module MechanizeStore
    class Product < ActiveRecord::Base
        belongs_to :product_category, class_name: MechanizeStore::ProductCategory
        has_many :product_photos, class_name: MechanizeStore::ProductPhoto

        validates :name, :price, :description, :short_description, :weight, :length, :width, :height, presence: true

        def first_photo
            return nil if self.product_photos.empty?
            return self.product_photos.first
        end
    end
end

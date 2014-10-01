# require_dependency "mechanize_store/application_controller"

module MechanizeStore
  module Store
    class ProductsController < ApplicationController
      def index
      	@products = Product.all
      end
    end
  end
end

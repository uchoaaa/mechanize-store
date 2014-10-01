module MechanizeStore
  module Admin
    class ProductCategoriesController < ApplicationController
      before_action :set_product_category, only: [:show, :edit, :update, :destroy]
      before_action -> { active_menu :configs }

      respond_to :html, :json, :xml

      def index
        @search = ProductCategory.search(params[:q])

        @product_categories = @search.result.paginate(page: params[:page])

        respond_with @product_categories
      end

      def show
        respond_with @product_category
      end

      def new
        @product_category = ProductCategory.new
        respond_with @product_category
      end

      def edit
        respond_with @product_category
      end

      def create
        @product_category = ProductCategory.new(product_category_params)

        respond_with @product_category do |format|  
          if @product_category.save
            format.html do 
              flash[:notice] = I18n.t(:created, model: I18n.t(:product_category, scope: "activerecord.models")) 
              redirect_to [:admin, @product_category]
            end
          else
            format.html { render action: "new" }
          end
        end
      end

      def update
        @product_category = ProductCategory.find(params[:id])

        respond_with @product_category do |format|
          if @product_category.update(product_category_params)
            format.html do 
              flash[:notice] = I18n.t(:updated, model: I18n.t(:product_category, scope: "activerecord.models")) 
              redirect_to [:admin, @product_category]
            end
          else
            format.html { render action: "edit" }
          end
        end
      end

      def destroy
        @product_category = ProductCategory.find(params[:id])

        flash[:alert] = I18n.t(:removed, model: I18n.t(:product_category, scope: "activerecord.models")) if @product_category.destroy

        respond_with @product_category, :location => product_categories_url
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_product_category
        @product_category = ProductCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_category_params
        params.require(:product_category).permit(:name, :product_section_id)
      end
    end
  end
end
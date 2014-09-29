module MechanizeStore
  module Admin
    class ProductSectionsController < ApplicationController
      before_action :set_product_section, only: [:show, :edit, :update, :destroy]
      before_action -> { active_menu :configs }

      respond_to :html, :json, :xml

      def index
        @search = ProductSection.search(params[:q])

        @product_sections = @search.result.paginate(page: params[:page])

        respond_with @product_sections
      end

      def show
        respond_with @product_section
      end

      def new
        @product_section = ProductSection.new
        respond_with @product_section
      end

      def edit
        respond_with @product_section
      end

      def create
        @product_section = ProductSection.new(product_section_params)

        respond_with @product_section do |format|  
          if @product_section.save
            format.html do 
              flash[:notice] = I18n.t(:created, model: I18n.t(:product_section, scope: "activerecord.models")) 
              redirect_to [:admin, @product_section]
            end
          else
            format.html { render action: "new" }
          end
        end
      end

      def update
        @product_section = ProductSection.find(params[:id])

        respond_with @product_section do |format|
          if @product_section.update(product_section_params)
            format.html do 
              flash[:notice] = I18n.t(:updated, model: I18n.t(:product_section, scope: "activerecord.models")) 
              redirect_to [:admin, @product_section]
            end
          else
            format.html { render action: "edit" }
          end
        end
      end

      def destroy
        @product_section = ProductSection.find(params[:id])
      
        flash[:alert] = I18n.t(:removed, model: I18n.t(:product_section, scope: "activerecord.models")) if @product_section.destroy

        respond_with @product_section, :location => product_sections_url
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_product_section
        @product_section = ProductSection.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_section_params
        params.require(:product_section).permit(:name)
      end
    end
  end
end
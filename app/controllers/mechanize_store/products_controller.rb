module MechanizeStore
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    respond_to :html, :json, :xml

    def index
      @search = Product.search(params[:q])

      @products = @search.result.paginate(page: params[:page])

      respond_with @products
    end

    def show
      respond_with @product
    end

    def new
      @product = Product.new
      respond_with @product
    end

    def edit
      respond_with @product
    end

    def create
      @product = Product.new(product_params)

      respond_with @product do |format|
        if @product.save
          format.html do
            flash[:notice] = I18n.t(:created, model: I18n.t(:product, scope: "activerecord.models"))
            redirect_to @product
          end
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @product = Product.find(params[:id])

      respond_with @product do |format|
        if @product.update(product_params)
          format.html do
            flash[:notice] = I18n.t(:updated, model: I18n.t(:product, scope: "activerecord.models"))
            redirect_to @product
          end
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @product = Product.find(params[:id])

      flash[:alert] = I18n.t(:deleted, model: I18n.t(:product, scope: "activerecord.models")) if @product.destroy

      respond_with @product, :location => products_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :short_description, :price, :weight, :lenght, :height, :product_category_id)
    end
  end
end

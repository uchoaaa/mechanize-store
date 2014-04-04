require_dependency "mechanize_store/application_controller"

module MechanizeStore
    class ProductPhotosController < ApplicationController
        respond_to :html, :json

        def index
            @product = Product.find(params[:product_id])
            
            @product_photos = @product.product_photos

            respond_with @product_photos
        end
        
        def create
            @product_photos = []

            @product = Product.find(params[:product_id])

            @product_photo = @product.product_photos.new(file: params["product_photo"]["file"][0])
        
            respond_with @product_photo do |format|
                if @product_photo.save
                    @product_photos << @product_photo
                    format.html { redirect_to @product, notice: I18n.t(:created, model: I18n.t(:product_photo, scope: 'activerecord.models')) }
                else
                    format.html { render action: 'new' }
                end
            end
        end 

        def destroy
            @product_photo = ProductPhoto.find(params[:id])
            @product = @product_photo.product                        
            @product_photo.destroy

            respond_with @product_photo do |format| 
                format.html do 
                    redirect_to @product
                end
            end
        end 

        private
        def product_photo_params
            params.require(:product_photo).permit(:product_id, file: [])
        end
    end
end

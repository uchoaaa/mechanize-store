require 'spec_helper'

module MechanizeStore
  describe ProductPhotosController do

    routes { MechanizeStore::Engine.routes }

    let(:valid_attributes) { { "file" => fixture_file_upload('rails.png'), product_id: @product.id } }

    let(:valid_session) { {} }

    before do
        @product = FactoryGirl.create(:mechanize_store_product)
    end

    describe "GET index" do 
      it "assigns all product_photos as @product_photos" do
        payment_type = ProductPhoto.create! valid_attributes 
        get :index, { product_id: @product.id, format: "json" }, valid_session
        assigns(:product_photos).should eq(@product.product_photos)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ProductCategory" do
          expect {
            post :create, { product_id: @product.id, :product_photo => valid_attributes }, valid_session
          }.to change(ProductPhoto, :count).by(1)
        end

        it "assigns a newly created product_photo as @product_photo" do
          post :create, { product_id: @product.id, :product_photo => valid_attributes }, valid_session
          
          assigns(:product_photo).should be_a(ProductPhoto)
          assigns(:product_photo).should be_persisted
        end

        it "redirects to the created product_photo" do
          post :create, { :product_photo => valid_attributes, product_id: @product.id }, valid_session

          response.should redirect_to(@product)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved product_photo as @product_photo" do
          # Trigger the behavior that occurs when invalid params are submitted
          ProductCategory.any_instance.stub(:save).and_return(false)

          post :create, { product_id: @product.id, format: "json", :product_photo => { "name" => "invalid value" }}, valid_session

          assigns(:product_photo).should be_a_new(ProductPhoto)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested product_photo" do
        product_photo = ProductPhoto.create! valid_attributes

        expect {
          delete :destroy, {:id => product_photo.to_param}, valid_session
        }.to change(ProductPhoto, :count).by(-1)
      end

      it "redirects to the product" do
        product_photo = ProductPhoto.create! valid_attributes
        product = product_photo.product
        delete :destroy, {:id => product_photo.to_param}, valid_session
        response.should redirect_to(product_url(product))
      end
    end
  end
end

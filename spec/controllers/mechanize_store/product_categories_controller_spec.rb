require 'spec_helper'

module MechanizeStore
  describe ProductCategoriesController do
    routes { MechanizeStore::Engine.routes }

    let(:valid_attributes) { { "name" => "MyString" } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all product_categories as @product_categories" do
        product_category = ProductCategory.create! valid_attributes
        get :index, {}, valid_session
        assigns(:product_categories).should eq([product_category])
      end
    end

    describe "GET show" do
      it "assigns the requested product_category as @product_category" do
        product_category = ProductCategory.create! valid_attributes
        get :show, {:id => product_category.to_param}, valid_session
        assigns(:product_category).should eq(product_category)
      end
    end

    describe "GET new" do
      it "assigns a new product_category as @product_category" do
        get :new, {}, valid_session
        assigns(:product_category).should be_a_new(ProductCategory)
      end
    end

    describe "GET edit" do
      it "assigns the requested product_category as @product_category" do
        product_category = ProductCategory.create! valid_attributes
        get :edit, {:id => product_category.to_param}, valid_session
        assigns(:product_category).should eq(product_category)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ProductCategory" do
          expect {
            post :create, {:product_category => valid_attributes}, valid_session
          }.to change(ProductCategory, :count).by(1)
        end

        it "assigns a newly created product_category as @product_category" do
          post :create, {:product_category => valid_attributes}, valid_session
          assigns(:product_category).should be_a(ProductCategory)
          assigns(:product_category).should be_persisted
        end

        it "redirects to the created product_category" do
          post :create, {:product_category => valid_attributes}, valid_session
          response.should redirect_to(ProductCategory.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved product_category as @product_category" do
          # Trigger the behavior that occurs when invalid params are submitted
          ProductCategory.any_instance.stub(:save).and_return(false)
          post :create, {:product_category => { "name" => "invalid value" }}, valid_session
          assigns(:product_category).should be_a_new(ProductCategory)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          ProductCategory.any_instance.stub(:save).and_return(false)
          post :create, {:product_category => { "name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested product_category" do
          product_category = ProductCategory.create! valid_attributes
          # Assuming there are no other product_categories in the database, this
          # specifies that the ProductCategory created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          ProductCategory.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => product_category.to_param, :product_category => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested product_category as @product_category" do
          product_category = ProductCategory.create! valid_attributes
          put :update, {:id => product_category.to_param, :product_category => valid_attributes}, valid_session
          assigns(:product_category).should eq(product_category)
        end

        it "redirects to the product_category" do
          product_category = ProductCategory.create! valid_attributes
          put :update, {:id => product_category.to_param, :product_category => valid_attributes}, valid_session
          response.should redirect_to(product_category)
        end
      end

      describe "with invalid params" do
        it "assigns the product_category as @product_category" do
          product_category = ProductCategory.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ProductCategory.any_instance.stub(:save).and_return(false)
          put :update, {:id => product_category.to_param, :product_category => { "name" => "invalid value" }}, valid_session
          assigns(:product_category).should eq(product_category)
        end

        it "re-renders the 'edit' template" do
          product_category = ProductCategory.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ProductCategory.any_instance.stub(:save).and_return(false)
          put :update, {:id => product_category.to_param, :product_category => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested product_category" do
        product_category = ProductCategory.create! valid_attributes
        expect {
          delete :destroy, {:id => product_category.to_param}, valid_session
        }.to change(ProductCategory, :count).by(-1)
      end

      it "redirects to the product_categories list" do
        product_category = ProductCategory.create! valid_attributes
        delete :destroy, {:id => product_category.to_param}, valid_session
        response.should redirect_to(product_categories_url)
      end
    end

  end
end

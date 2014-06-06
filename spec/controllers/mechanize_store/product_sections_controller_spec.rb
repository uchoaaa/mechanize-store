require 'spec_helper'

module MechanizeStore
  describe ProductSectionsController do

    routes { MechanizeStore::Engine.routes }
    
    let(:valid_attributes) { { "name" => "MyString" } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all product_sections as @product_sections" do
        product_section = ProductSection.create! valid_attributes
        get :index, {}, valid_session
        assigns(:product_sections).should eq([product_section])
      end
    end

    describe "GET show" do
      it "assigns the requested product_section as @product_section" do
        product_section = ProductSection.create! valid_attributes
        get :show, {:id => product_section.to_param}, valid_session
        assigns(:product_section).should eq(product_section)
      end
    end

    describe "GET new" do
      it "assigns a new product_section as @product_section" do
        get :new, {}, valid_session
        assigns(:product_section).should be_a_new(ProductSection)
      end
    end

    describe "GET edit" do
      it "assigns the requested product_section as @product_section" do
        product_section = ProductSection.create! valid_attributes
        get :edit, {:id => product_section.to_param}, valid_session
        assigns(:product_section).should eq(product_section)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ProductSection" do
          expect {
            post :create, {:product_section => valid_attributes}, valid_session
          }.to change(ProductSection, :count).by(1)
        end

        it "assigns a newly created product_section as @product_section" do
          post :create, {:product_section => valid_attributes}, valid_session
          assigns(:product_section).should be_a(ProductSection)
          assigns(:product_section).should be_persisted
        end

        it "redirects to the created product_section" do
          post :create, {:product_section => valid_attributes}, valid_session
          response.should redirect_to(ProductSection.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved product_section as @product_section" do
          # Trigger the behavior that occurs when invalid params are submitted
          ProductSection.any_instance.stub(:save).and_return(false)
          post :create, {:product_section => { "name" => "invalid value" }}, valid_session
          assigns(:product_section).should be_a_new(ProductSection)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          ProductSection.any_instance.stub(:save).and_return(false)
          post :create, {:product_section => { "name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested product_section" do
          product_section = ProductSection.create! valid_attributes
          # Assuming there are no other product_sections in the database, this
          # specifies that the ProductSection created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          ProductSection.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => product_section.to_param, :product_section => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested product_section as @product_section" do
          product_section = ProductSection.create! valid_attributes
          put :update, {:id => product_section.to_param, :product_section => valid_attributes}, valid_session
          assigns(:product_section).should eq(product_section)
        end

        it "redirects to the product_section" do
          product_section = ProductSection.create! valid_attributes
          put :update, {:id => product_section.to_param, :product_section => valid_attributes}, valid_session
          response.should redirect_to(product_section)
        end
      end

      describe "with invalid params" do
        it "assigns the product_section as @product_section" do
          product_section = ProductSection.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ProductSection.any_instance.stub(:save).and_return(false)
          put :update, {:id => product_section.to_param, :product_section => { "name" => "invalid value" }}, valid_session
          assigns(:product_section).should eq(product_section)
        end

        it "re-renders the 'edit' template" do
          product_section = ProductSection.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ProductSection.any_instance.stub(:save).and_return(false)
          put :update, {:id => product_section.to_param, :product_section => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested product_section" do
        product_section = ProductSection.create! valid_attributes
        expect {
          delete :destroy, {:id => product_section.to_param}, valid_session
        }.to change(ProductSection, :count).by(-1)
      end

      it "redirects to the product_sections list" do
        product_section = ProductSection.create! valid_attributes
        delete :destroy, {:id => product_section.to_param}, valid_session
        response.should redirect_to(product_sections_url)
      end
    end

  end
end

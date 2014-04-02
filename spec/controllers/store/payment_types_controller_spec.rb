require 'spec_helper'

module MechanizeStore
  describe PaymentTypesController do

    routes { MechanizeStore::Engine.routes }

    let(:valid_attributes) { { "name" => "MyString" } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all payment_types as @payment_types" do
        payment_type = PaymentType.create! valid_attributes
        get :index, {}, valid_session
        assigns(:payment_types).should eq([payment_type])
      end
    end

    describe "GET show" do
      it "assigns the requested payment_type as @payment_type" do
        payment_type = PaymentType.create! valid_attributes
        get :show, {:id => payment_type.to_param}, valid_session
        assigns(:payment_type).should eq(payment_type)
      end
    end

    describe "GET new" do
      it "assigns a new payment_type as @payment_type" do
        get :new, {}, valid_session
        assigns(:payment_type).should be_a_new(PaymentType)
      end
    end

    describe "GET edit" do
      it "assigns the requested payment_type as @payment_type" do
        payment_type = PaymentType.create! valid_attributes
        get :edit, {:id => payment_type.to_param}, valid_session
        assigns(:payment_type).should eq(payment_type)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new PaymentType" do
          expect {
            post :create, {:payment_type => valid_attributes}, valid_session
          }.to change(PaymentType, :count).by(1)
        end

        it "assigns a newly created payment_type as @payment_type" do
          post :create, {:payment_type => valid_attributes}, valid_session
          assigns(:payment_type).should be_a(PaymentType)
          assigns(:payment_type).should be_persisted
        end

        it "redirects to the created payment_type" do
          post :create, {:payment_type => valid_attributes}, valid_session
          response.should redirect_to(PaymentType.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved payment_type as @payment_type" do
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentType.any_instance.stub(:save).and_return(false)
          post :create, {:payment_type => { "name" => "invalid value" }}, valid_session
          assigns(:payment_type).should be_a_new(PaymentType)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentType.any_instance.stub(:save).and_return(false)
          post :create, {:payment_type => { "name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested payment_type" do
          payment_type = PaymentType.create! valid_attributes
          # Assuming there are no other payment_types in the database, this
          # specifies that the PaymentType created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          PaymentType.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => payment_type.to_param, :payment_type => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested payment_type as @payment_type" do
          payment_type = PaymentType.create! valid_attributes
          put :update, {:id => payment_type.to_param, :payment_type => valid_attributes}, valid_session
          assigns(:payment_type).should eq(payment_type)
        end

        it "redirects to the payment_type" do
          payment_type = PaymentType.create! valid_attributes
          put :update, {:id => payment_type.to_param, :payment_type => valid_attributes}, valid_session
          response.should redirect_to(payment_type)
        end
      end

      describe "with invalid params" do
        it "assigns the payment_type as @payment_type" do
          payment_type = PaymentType.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentType.any_instance.stub(:save).and_return(false)
          put :update, {:id => payment_type.to_param, :payment_type => { "name" => "invalid value" }}, valid_session
          assigns(:payment_type).should eq(payment_type)
        end

        it "re-renders the 'edit' template" do
          payment_type = PaymentType.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentType.any_instance.stub(:save).and_return(false)
          put :update, {:id => payment_type.to_param, :payment_type => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested payment_type" do
        payment_type = PaymentType.create! valid_attributes
        expect {
          delete :destroy, {:id => payment_type.to_param}, valid_session
        }.to change(PaymentType, :count).by(-1)
      end

      it "redirects to the payment_types list" do
        payment_type = PaymentType.create! valid_attributes
        delete :destroy, {:id => payment_type.to_param}, valid_session
        response.should redirect_to(payment_types_url)
      end
    end

  end
end

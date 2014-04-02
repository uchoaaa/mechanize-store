require 'spec_helper'

module Store
  describe PaymentStatusesController do

    routes { Store::Engine.routes }

    let(:valid_attributes) {{ "name" => "MyString" }}
    let(:valid_session) {{  }}

    describe "GET index" do
      it "assigns all payment_statuses as @payment_statuses" do
        payment_status = PaymentStatus.create! valid_attributes
        get :index, {}, valid_session
        assigns(:payment_statuses).should eq([payment_status])
      end
    end

    describe "GET show" do
      it "assigns the requested payment_status as @payment_status" do
        payment_status = PaymentStatus.create! valid_attributes
        get :show, {:id => payment_status.to_param}, valid_session
        assigns(:payment_status).should eq(payment_status)
      end
    end

    describe "GET new" do
      it "assigns a new payment_status as @payment_status" do
        get :new, {}, valid_session
        assigns(:payment_status).should be_a_new(PaymentStatus)
      end
    end

    describe "GET edit" do
      it "assigns the requested payment_status as @payment_status" do
        payment_status = PaymentStatus.create! valid_attributes
        get :edit, {:id => payment_status.to_param}, valid_session
        assigns(:payment_status).should eq(payment_status)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new PaymentStatus" do
          expect {
            post :create, {:payment_status => valid_attributes}, valid_session
          }.to change(PaymentStatus, :count).by(1)
        end

        it "assigns a newly created payment_status as @payment_status" do
          post :create, {:payment_status => valid_attributes}, valid_session
          assigns(:payment_status).should be_a(PaymentStatus)
          assigns(:payment_status).should be_persisted
        end

        it "redirects to the created payment_status" do
          post :create, {:payment_status => valid_attributes}, valid_session
          response.should redirect_to(PaymentStatus.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved payment_status as @payment_status" do
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentStatus.any_instance.stub(:save).and_return(false)
          post :create, {:payment_status => { "name" => "invalid value" }}, valid_session
          assigns(:payment_status).should be_a_new(PaymentStatus)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentStatus.any_instance.stub(:save).and_return(false)
          post :create, {:payment_status => { "name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested payment_status" do
          payment_status = PaymentStatus.create! valid_attributes
          # Assuming there are no other payment_statuses in the database, this
          # specifies that the PaymentStatus created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          PaymentStatus.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => payment_status.to_param, :payment_status => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested payment_status as @payment_status" do
          payment_status = PaymentStatus.create! valid_attributes
          put :update, {:id => payment_status.to_param, :payment_status => valid_attributes}, valid_session
          assigns(:payment_status).should eq(payment_status)
        end

        it "redirects to the payment_status" do
          payment_status = PaymentStatus.create! valid_attributes
          put :update, {:id => payment_status.to_param, :payment_status => valid_attributes}, valid_session
          response.should redirect_to(payment_status)
        end
      end

      describe "with invalid params" do
        it "assigns the payment_status as @payment_status" do
          payment_status = PaymentStatus.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentStatus.any_instance.stub(:save).and_return(false)
          put :update, {:id => payment_status.to_param, :payment_status => { "name" => "invalid value" }}, valid_session
          assigns(:payment_status).should eq(payment_status)
        end

        it "re-renders the 'edit' template" do
          payment_status = PaymentStatus.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PaymentStatus.any_instance.stub(:save).and_return(false)
          put :update, {:id => payment_status.to_param, :payment_status => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested payment_status" do
        payment_status = PaymentStatus.create! valid_attributes
        expect {
          delete :destroy, {:id => payment_status.to_param}, valid_session
        }.to change(PaymentStatus, :count).by(-1)
      end

      it "redirects to the payment_statuses list" do
        payment_status = PaymentStatus.create! valid_attributes
        delete :destroy, {:id => payment_status.to_param}, valid_session
        response.should redirect_to(payment_statuses_url)
      end
    end

  end
end

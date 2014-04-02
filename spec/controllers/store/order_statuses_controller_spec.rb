require 'spec_helper'

module MechanizeStore
  describe OrderStatusesController do
    routes { MechanizeStore::Engine.routes }
    
    let(:valid_attributes) { { "name" => "MyString" } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all order_statuses as @order_statuses" do
        order_status = OrderStatus.create! valid_attributes
        get :index, {}, valid_session
        assigns(:order_statuses).should eq([order_status])
      end
    end

    describe "GET show" do
      it "assigns the requested order_status as @order_status" do
        order_status = OrderStatus.create! valid_attributes
        get :show, {:id => order_status.to_param}, valid_session
        assigns(:order_status).should eq(order_status)
      end
    end

    describe "GET new" do
      it "assigns a new order_status as @order_status" do
        get :new, {}, valid_session
        assigns(:order_status).should be_a_new(OrderStatus)
      end
    end

    describe "GET edit" do
      it "assigns the requested order_status as @order_status" do
        order_status = OrderStatus.create! valid_attributes
        get :edit, {:id => order_status.to_param}, valid_session
        assigns(:order_status).should eq(order_status)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new OrderStatus" do
          expect {
            post :create, {:order_status => valid_attributes}, valid_session
          }.to change(OrderStatus, :count).by(1)
        end

        it "assigns a newly created order_status as @order_status" do
          post :create, {:order_status => valid_attributes}, valid_session
          assigns(:order_status).should be_a(OrderStatus)
          assigns(:order_status).should be_persisted
        end

        it "redirects to the created order_status" do
          post :create, {:order_status => valid_attributes}, valid_session
          response.should redirect_to(OrderStatus.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved order_status as @order_status" do
          # Trigger the behavior that occurs when invalid params are submitted
          OrderStatus.any_instance.stub(:save).and_return(false)
          post :create, {:order_status => { "name" => nil }}, valid_session
          assigns(:order_status).should be_a_new(OrderStatus)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          OrderStatus.any_instance.stub(:save).and_return(false)
          post :create, { :order_status => { "name" => nil } }, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested order_status" do
          order_status = OrderStatus.create! valid_attributes
          # Assuming there are no other order_statuses in the database, this
          # specifies that the OrderStatus created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          OrderStatus.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => order_status.to_param, :order_status => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested order_status as @order_status" do
          order_status = OrderStatus.create! valid_attributes
          put :update, {:id => order_status.to_param, :order_status => valid_attributes}, valid_session
          assigns(:order_status).should eq(order_status)
        end

        it "redirects to the order_status" do
          order_status = OrderStatus.create! valid_attributes
          put :update, {:id => order_status.to_param, :order_status => valid_attributes}, valid_session
          response.should redirect_to(order_status)
        end
      end

      describe "with invalid params" do
        it "assigns the order_status as @order_status" do
          order_status = OrderStatus.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          OrderStatus.any_instance.stub(:save).and_return(false)
          put :update, {:id => order_status.to_param, :order_status => { "name" => nil }}, valid_session
          assigns(:order_status).should eq(order_status)
        end

        it "re-renders the 'edit' template" do
          order_status = OrderStatus.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          OrderStatus.any_instance.stub(:save).and_return(false)
          put :update, {:id => order_status.to_param, :order_status => { "name" => nil }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested order_status" do
        order_status = OrderStatus.create! valid_attributes
        expect {
          delete :destroy, {:id => order_status.to_param}, valid_session
        }.to change(OrderStatus, :count).by(-1)
      end

      it "redirects to the order_statuses list" do
        order_status = OrderStatus.create! valid_attributes
        delete :destroy, {:id => order_status.to_param}, valid_session
        response.should redirect_to(order_statuses_url)
      end
    end

  end
end

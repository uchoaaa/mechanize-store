require 'spec_helper'

module MechanizeStore
  describe MechanizeStore::OrdersController do
    routes { MechanizeStore::Engine.routes }

    before do
        @payment = FactoryGirl.create(:mechanize_store_payment)
        @order = FactoryGirl.create(:mechanize_store_order, payment: @payment)
    end

    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all order_statuses as @order_statuses" do
        get :index, {}, valid_session
        assigns(:orders).should eq([@order])
      end
    end

    describe "GET show" do
      it "assigns the requested order_status as @order_status" do
        get :show, {:id => @order.to_param}, valid_session
        assigns(:order).should eq(@order)
      end
    end

  end
end

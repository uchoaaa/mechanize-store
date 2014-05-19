require 'spec_helper'

module MechanizeStore
  describe MechanizeStore::OrdersController do
    routes { MechanizeStore::Engine.routes }

    before do
      @payment_type = FactoryGirl.create(:mechanize_store_payment_type)
      @flag = FactoryGirl.create(:mechanize_store_flag)
      @payment = FactoryGirl.build(:mechanize_store_payment, payment_type: @payment_type, flag: @flag)
      @order_status = FactoryGirl.create(:mechanize_store_order_status)
      @freight = FactoryGirl.create(:mechanize_store_freight)
      @order = FactoryGirl.create(:mechanize_store_order, payment: @payment, order_status: @order_status, freight: @freight)
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

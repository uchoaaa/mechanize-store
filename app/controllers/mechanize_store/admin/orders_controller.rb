module MechanizeStore
  module Admin
    class OrdersController < ApplicationController
      respond_to :html, :json

      before_action :fetch_collections, only: [:index]
      before_action -> { active_menu :orders }

      def fetch_collections
        @order_statuses = Order.statuses_collection
        @payment_statuses = Payment.statuses_collection
      end

      def index
        params[:q] ||= {}

        @search = Order.search(params[:q])

        @orders = @search.result.paginate(page: params[:page])

        respond_with @orders
      end 

      def show
        @order = Order.find(params[:id])
        respond_with @order
      end 
    end
  end
end

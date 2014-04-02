require_dependency "mechanize_store/application_controller"

module MechanizeStore
    class OrdersController < ApplicationController
        respond_to :html, :json

        before_action :fetch_collections, only: [:index]

        def fetch_collections
            @order_statuses = OrderStatus.all
            @payment_statuses = PaymentStatus.all
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

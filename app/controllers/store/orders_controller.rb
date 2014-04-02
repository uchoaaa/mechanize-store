require_dependency "store/application_controller"

module Store
    class OrdersController < ApplicationController
        respond_to :html, :json

        def index
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

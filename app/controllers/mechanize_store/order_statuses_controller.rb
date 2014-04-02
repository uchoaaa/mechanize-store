module MechanizeStore
  class OrderStatusesController < ApplicationController
    before_action :set_order_status, only: [:show, :edit, :update, :destroy]

    respond_to :html, :json, :xml

    def index
      @search = OrderStatus.search(params[:q])

      @order_statuses = @search.result.paginate(page: params[:page])

      respond_with @order_statuses
    end

    def show
      respond_with @order_status
    end

    def new
      @order_status = OrderStatus.new
      respond_with @order_status
    end

    def edit
      respond_with @order_status
    end

    def create
      @order_status = OrderStatus.new(order_status_params)

      respond_with @order_status do |format|
        if @order_status.save
          format.html do 
            flash[:notice] = I18n.t(:created, model: I18n.t(:order_status, scope: "activerecord.models")) 
            redirect_to @order_status
          end
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @order_status = OrderStatus.find(params[:id])

      respond_with @order_status do |format|
        if @order_status.update(order_status_params) 
          format.html do 
            flash[:notice] = I18n.t(:updated, model: I18n.t(:order_status, scope: "activerecord.models")) 
            redirect_to @order_status
          end
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @order_status = OrderStatus.find(params[:id])
      
      flash[:alert] = I18n.t(:deleted, model: I18n.t(:order_status, scope: "activerecord.models")) if @order_status.destroy

      respond_with @order_status, :location => order_statuses_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_status
      @order_status = OrderStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_status_params
      params.require(:order_status).permit(:name)
    end
  end
end
module MechanizeStore
  class PaymentStatusesController < ApplicationController
    before_action :set_payment_status, only: [:show, :edit, :update, :destroy]

    respond_to :html, :json, :xml

    def index
      @search = PaymentStatus.search(params[:q])

      @payment_statuses = @search.result.paginate(page: params[:page])

      respond_with @payment_statuses
    end

    def show
      respond_with @payment_status
    end

    def new
      @payment_status = PaymentStatus.new
      respond_with @payment_status
    end

    def edit
      respond_with @payment_status
    end

    def create
      @payment_status = PaymentStatus.new(payment_status_params)

      respond_with @payment_status do |format|
        if @payment_status.save
          format.html do 
            flash[:notice] = I18n.t(:created, model: I18n.t(:payment_status, scope: "activerecord.models")) 
            redirect_to @payment_status
          end
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @payment_status = PaymentStatus.find(params[:id])

      respond_with @payment_status do |format|
        if @payment_status.update(payment_status_params)
          format.html do 
            flash[:notice] = I18n.t(:updated, model: I18n.t(:payment_status, scope: "activerecord.models")) 
            redirect_to @payment_status
          end
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @payment_status = PaymentStatus.find(params[:id])
      
      flash[:alert] = I18n.t(:deleted, model: I18n.t(:payment_status, scope: "activerecord.models")) if @payment_status.destroy

      respond_with @payment_status, :location => payment_statuses_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_status
      @payment_status = PaymentStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_status_params
      params.require(:payment_status).permit(:name)
    end
  end
end
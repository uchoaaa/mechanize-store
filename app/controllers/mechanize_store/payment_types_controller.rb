module MechanizeStore
  class PaymentTypesController < ApplicationController
    before_action :set_payment_type, only: [:show, :edit, :update, :destroy]

    respond_to :html, :json, :xml

    def index
      @search = PaymentType.search(params[:q])

      @payment_types = @search.result.paginate(page: params[:page])

      respond_with @payment_types
    end

    def show
      respond_with @payment_type
    end

    def new
      @payment_type = PaymentType.new
      respond_with @payment_type
    end

    def edit
      respond_with @payment_type
    end

    def create
      @payment_type = PaymentType.new(payment_type_params)

      respond_with @payment_type do |format|
        if @payment_type.save
          format.html do 
            flash[:notice] = I18n.t(:created, model: I18n.t(:payment_type, scope: "activerecord.models")) 
            redirect_to @payment_type
          end
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @payment_type = PaymentType.find(params[:id])

      respond_with @payment_type do |format|
        if @payment_type.update(payment_type_params)
          format.html do 
            flash[:notice] = I18n.t(:updated, model: I18n.t(:payment_type, scope: "activerecord.models")) 
            redirect_to @payment_type
          end
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @payment_type = PaymentType.find(params[:id])
      
      flash[:alert] = I18n.t(:deleted, model: I18n.t(:payment_type, scope: "activerecord.models")) if @payment_type.destroy

      respond_with @payment_type, :location => payment_types_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_type
      @payment_type = PaymentType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_type_params
      params.require(:payment_type).permit(:name)
    end
  end
end
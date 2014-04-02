module Store
  class FlagsController < ApplicationController
    before_action :set_flag, only: [:show, :edit, :update, :destroy]

    respond_to :html, :json, :xml

    def index
      @search = Flag.search(params[:q])

      @flags = @search.result.paginate(page: params[:page])

      respond_with @flags
    end

    def show
      respond_with @flag
    end

    def new
      @flag = Flag.new
      respond_with @flag
    end

    def edit
      respond_with @flag
    end

    def create
      @flag = Flag.new(flag_params)

      respond_with @flag do |format|
        if @flag.save 
          format.html do 
            flash[:notice] = I18n.t(:created, model: I18n.t(:flag, scope: "activerecord.models")) 
            redirect_to @flag
          end
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @flag = Flag.find(params[:id])

      respond_with @flag do |format|
        if @flag.update(flag_params)
          format.html do 
            flash[:notice] = I18n.t(:updated, model: I18n.t(:flag, scope: "activerecord.models")) 
            redirect_to @flag
          end
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @flag = Flag.find(params[:id])
      
      flash[:alert] = I18n.t(:deleted, model: I18n.t(:flag, scope: "activerecord.models")) if @flag.destroy

      respond_with @flag, :location => flags_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flag_params
      params.require(:flag).permit(:name)
    end
  end
end
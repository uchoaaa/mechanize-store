require_dependency "mechanize_store/application_controller"

module MechanizeStore
  class DashboardsController < ApplicationController
    before_action -> { active_menu :dashboard }
    
    def show
    end

  end
end

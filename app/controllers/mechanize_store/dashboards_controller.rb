require_dependency "mechanize_store/application_controller"

module MechanizeStore
  class DashboardsController < ApplicationController
    def show
      active_menu :dashboard
    end
  end
end

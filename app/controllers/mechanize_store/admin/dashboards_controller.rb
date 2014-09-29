module MechanizeStore
  module Admin
    class DashboardsController < ApplicationController
      before_action -> { active_menu :dashboard }
    
      def show
      end
    end
  end
end

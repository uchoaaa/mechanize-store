module MechanizeStore
  module Admin
    class ApplicationController < ActionController::Base
      include CommonHelpers::ControllerHelpers
      helper  CommonHelpers::ViewHelpers

      layout 'sb-admin'

      before_action :authenticate_manager!
    end
  end
end

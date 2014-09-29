module MechanizeStore
  module Admin
    class ApplicationController < ActionController::Base
      include CommonHelpers::ControllerHelpers
      helper  CommonHelpers::ViewHelpers

      layout 'sb-admin'
    end
  end
end

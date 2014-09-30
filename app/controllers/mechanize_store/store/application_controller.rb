module MechanizeStore
  module Store
    class ApplicationController < ActionController::Base
      include CommonHelpers::ControllerHelpers
      helper  CommonHelpers::ViewHelpers

      layout 'front-store'
    end
  end
end

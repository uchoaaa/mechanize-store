require "spec_helper"

module MechanizeStore
  describe FlagsController do
    routes { MechanizeStore::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        get("/orders").should route_to("mechanize_store/orders#index")
      end

      it "routes to #show" do
        get("/orders/1").should route_to("mechanize_store/orders#show", :id => "1")
      end
    end
  end
end

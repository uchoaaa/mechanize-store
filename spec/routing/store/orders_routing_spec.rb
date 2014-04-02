require "spec_helper"

module Store
  describe FlagsController do
    routes { Store::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        get("/orders").should route_to("store/orders#index")
      end

      it "routes to #show" do
        get("/orders/1").should route_to("store/orders#show", :id => "1")
      end
    end
  end
end

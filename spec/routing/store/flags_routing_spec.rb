require "spec_helper"

module Store
  describe FlagsController do
    routes { Store::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        get("/flags").should route_to("store/flags#index")
      end

      it "routes to #new" do
        get("/flags/new").should route_to("store/flags#new")
      end

      it "routes to #show" do
        get("/flags/1").should route_to("store/flags#show", :id => "1")
      end

      it "routes to #edit" do
        get("/flags/1/edit").should route_to("store/flags#edit", :id => "1")
      end

      it "routes to #create" do
        post("/flags").should route_to("store/flags#create")
      end

      it "routes to #update" do
        put("/flags/1").should route_to("store/flags#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/flags/1").should route_to("store/flags#destroy", :id => "1")
      end

    end
  end
end

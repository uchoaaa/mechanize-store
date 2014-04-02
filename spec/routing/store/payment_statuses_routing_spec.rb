require "spec_helper"

module Store
  describe PaymentStatusesController do
    describe "routing" do
      routes { Store::Engine.routes }

      it "routes to #index" do
        get("/payment_statuses").should route_to("store/payment_statuses#index")
      end

      it "routes to #new" do
        get("/payment_statuses/new").should route_to("store/payment_statuses#new")
      end

      it "routes to #show" do
        get("/payment_statuses/1").should route_to("store/payment_statuses#show", :id => "1")
      end

      it "routes to #edit" do
        get("/payment_statuses/1/edit").should route_to("store/payment_statuses#edit", :id => "1")
      end

      it "routes to #create" do
        post("/payment_statuses").should route_to("store/payment_statuses#create")
      end

      it "routes to #update" do
        put("/payment_statuses/1").should route_to("store/payment_statuses#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/payment_statuses/1").should route_to("store/payment_statuses#destroy", :id => "1")
      end

    end
  end
end

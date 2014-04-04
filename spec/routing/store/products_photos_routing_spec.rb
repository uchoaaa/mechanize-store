require "spec_helper"

module MechanizeStore
  describe ProductsController do
    describe "routing" do

      routes { MechanizeStore::Engine.routes }

      it "routes to #create" do
        post("/products/1/product_photos").should route_to("mechanize_store/product_photos#create", product_id: "1")
      end

      it "routes to #destroy" do
        delete("/product_photos/1").should route_to("mechanize_store/product_photos#destroy", :id => "1")
      end

    end
  end
end

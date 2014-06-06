require "spec_helper"

module MechanizeStore
  describe ProductsController do
    describe "routing" do

      routes { MechanizeStore::Engine.routes }

      it "routes to #index" do
        get("/products").should route_to("mechanize_store/products#index")
      end

      it "routes to #new" do
        get("/products/new").should route_to("mechanize_store/products#new")
      end

      it "routes to #show" do
        get("/products/1").should route_to("mechanize_store/products#show", :id => "1")
      end

      it "routes to #edit" do
        get("/products/1/edit").should route_to("mechanize_store/products#edit", :id => "1")
      end

      it "routes to #create" do
        post("/products").should route_to("mechanize_store/products#create")
      end

      it "routes to #update" do
        put("/products/1").should route_to("mechanize_store/products#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/products/1").should route_to("mechanize_store/products#destroy", :id => "1")
      end

    end
  end
end

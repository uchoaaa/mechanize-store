require "spec_helper"

module MechanizeStore
  describe ProductSectionsController do
    describe "routing" do

      routes { MechanizeStore::Engine.routes }

      it "routes to #index" do
        get("/product_sections").should route_to("mechanize_store/product_sections#index")
      end

      it "routes to #new" do
        get("/product_sections/new").should route_to("mechanize_store/product_sections#new")
      end

      it "routes to #show" do
        get("/product_sections/1").should route_to("mechanize_store/product_sections#show", :id => "1")
      end

      it "routes to #edit" do
        get("/product_sections/1/edit").should route_to("mechanize_store/product_sections#edit", :id => "1")
      end

      it "routes to #create" do
        post("/product_sections").should route_to("mechanize_store/product_sections#create")
      end

      it "routes to #update" do
        put("/product_sections/1").should route_to("mechanize_store/product_sections#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/product_sections/1").should route_to("mechanize_store/product_sections#destroy", :id => "1")
      end

    end
  end
end

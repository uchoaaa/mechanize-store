require 'spec_helper'

module Store
  describe FlagsController do
    routes { Store::Engine.routes }

    let(:valid_attributes) { { "name" => "MyString" } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all flags as @flags" do
        flag = Flag.create! valid_attributes
        get :index, {}, valid_session
        assigns(:flags).should eq([flag])
      end
    end

    describe "GET show" do
      it "assigns the requested flag as @flag" do
        flag = Flag.create! valid_attributes
        get :show, {:id => flag.to_param}, valid_session
        assigns(:flag).should eq(flag)
      end
    end

    describe "GET new" do
      it "assigns a new flag as @flag" do
        get :new, {}, valid_session
        assigns(:flag).should be_a_new(Flag)
      end
    end

    describe "GET edit" do
      it "assigns the requested flag as @flag" do
        flag = Flag.create! valid_attributes
        get :edit, {:id => flag.to_param}, valid_session
        assigns(:flag).should eq(flag)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Flag" do
          expect {
            post :create, {:flag => valid_attributes}, valid_session
          }.to change(Flag, :count).by(1)
        end

        it "assigns a newly created flag as @flag" do
          post :create, {:flag => valid_attributes}, valid_session
          assigns(:flag).should be_a(Flag)
          assigns(:flag).should be_persisted
        end

        it "redirects to the created flag" do
          post :create, {:flag => valid_attributes}, valid_session
          response.should redirect_to(Flag.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved flag as @flag" do
          # Trigger the behavior that occurs when invalid params are submitted
          Flag.any_instance.stub(:save).and_return(false)
          post :create, {:flag => { "name" => "invalid value" }}, valid_session
          assigns(:flag).should be_a_new(Flag)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Flag.any_instance.stub(:save).and_return(false)
          post :create, {:flag => { "name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested flag" do
          flag = Flag.create! valid_attributes
          # Assuming there are no other flags in the database, this
          # specifies that the Flag created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Flag.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => flag.to_param, :flag => { "name" => "MyString" }}, valid_session
        end

        it "assigns the requested flag as @flag" do
          flag = Flag.create! valid_attributes
          put :update, {:id => flag.to_param, :flag => valid_attributes}, valid_session
          assigns(:flag).should eq(flag)
        end

        it "redirects to the flag" do
          flag = Flag.create! valid_attributes
          put :update, {:id => flag.to_param, :flag => valid_attributes}, valid_session
          response.should redirect_to(flag)
        end
      end

      describe "with invalid params" do
        it "assigns the flag as @flag" do
          flag = Flag.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Flag.any_instance.stub(:save).and_return(false)
          put :update, {:id => flag.to_param, :flag => { "name" => "invalid value" }}, valid_session
          assigns(:flag).should eq(flag)
        end

        it "re-renders the 'edit' template" do
          flag = Flag.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Flag.any_instance.stub(:save).and_return(false)
          put :update, {:id => flag.to_param, :flag => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested flag" do
        flag = Flag.create! valid_attributes
        expect {
          delete :destroy, {:id => flag.to_param}, valid_session
        }.to change(Flag, :count).by(-1)
      end

      it "redirects to the flags list" do
        flag = Flag.create! valid_attributes
        delete :destroy, {:id => flag.to_param}, valid_session
        response.should redirect_to(flags_url)
      end
    end

  end
end

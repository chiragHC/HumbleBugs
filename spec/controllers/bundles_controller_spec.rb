require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BundlesController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BundlesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before do
    @user = FactoryGirl.create :user, :roles => [:dev]
  end

  describe "GET index" do
    it "assigns all bundles as @bundles" do
      bundle = FactoryGirl.create(:bundle)
      get_with @user, :index, {}, valid_session
      assigns(:bundles).should eq([bundle])
    end
  end

  describe "GET show" do
    it "assigns the requested bundle as @bundle" do
      bundle = FactoryGirl.create(:bundle)
      get_with @user, :show, {:id => bundle.to_param}, valid_session
      assigns(:bundle).should eq(bundle)
    end
  end

  describe "GET new" do
    it "assigns a new bundle as @bundle" do
      get_with @user, :new, {}, valid_session
      assigns(:bundle).should be_a_new(Bundle)
    end
  end

  describe "GET edit" do
    it "assigns the requested bundle as @bundle" do
      bundle = FactoryGirl.create(:bundle)
      get_with @user, :edit, {:id => bundle.to_param}, valid_session
      assigns(:bundle).should eq(bundle)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bundle" do
        expect {
          post_with @user, :create, {:bundle => FactoryGirl.attributes_for(:bundle)}, valid_session
        }.to change(Bundle, :count).by(1)
      end

      it "assigns a newly created bundle as @bundle" do
        post_with @user, :create, {:bundle => FactoryGirl.attributes_for(:bundle)}, valid_session
        assigns(:bundle).should be_a(Bundle)
        assigns(:bundle).should be_persisted
      end

      it "redirects to the created bundle" do
        post_with @user, :create, {:bundle => FactoryGirl.attributes_for(:bundle)}, valid_session
        response.should redirect_to(Bundle.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bundle as @bundle" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bundle.any_instance.stub(:save).and_return(false)
        post_with @user, :create, {:bundle => {}}, valid_session
        assigns(:bundle).should be_a_new(Bundle)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bundle.any_instance.stub(:save).and_return(false)
        post_with @user, :create, {:bundle => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bundle" do
        bundle = FactoryGirl.create(:bundle)
        # Assuming there are no other bundles in the database, this
        # specifies that the Bundle created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bundle.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put_with @user, :update, {:id => bundle.to_param, :bundle => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested bundle as @bundle" do
        bundle = FactoryGirl.create(:bundle)
        put_with @user, :update, {:id => bundle.to_param, :bundle => FactoryGirl.attributes_for(:bundle)}, valid_session
        assigns(:bundle).should eq(bundle)
      end

      it "redirects to the bundle" do
        bundle = FactoryGirl.create(:bundle)
        put_with @user, :update, {:id => bundle.to_param, :bundle => FactoryGirl.attributes_for(:bundle)}, valid_session
        response.should redirect_to(bundle)
      end
    end

    describe "with invalid params" do
      it "assigns the bundle as @bundle" do
        bundle = FactoryGirl.create(:bundle)
        # Trigger the behavior that occurs when invalid params are submitted
        Bundle.any_instance.stub(:save).and_return(false)
        put_with @user, :update, {:id => bundle.to_param, :bundle => {}}, valid_session
        assigns(:bundle).should eq(bundle)
      end

      it "re-renders the 'edit' template" do
        bundle = FactoryGirl.create(:bundle)
        # Trigger the behavior that occurs when invalid params are submitted
        Bundle.any_instance.stub(:save).and_return(false)
        put_with @user, :update, {:id => bundle.to_param, :bundle => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bundle" do
      bundle = FactoryGirl.create(:bundle)
      expect {
        delete_with @user, :destroy, {:id => bundle.to_param}, valid_session
      }.to change(Bundle, :count).by(-1)
    end

    it "redirects to the bundles list" do
      bundle = FactoryGirl.create(:bundle)
      delete_with @user, :destroy, {:id => bundle.to_param}, valid_session
      response.should redirect_to(bundles_url)
    end
  end

end

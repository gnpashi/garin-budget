require 'rails_helper'

RSpec.describe GarinsController, type: :controller do
	context "GET index" do

    it "assigns @garins" do
      garin = Garin.create
      get :index
      expect(assigns(:garins)).to eq([garin])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

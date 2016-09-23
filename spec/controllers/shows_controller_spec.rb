require 'rails_helper'
require 'byebug'

RSpec.describe ShowsController, type: :controller do

  before { @city = create(:city) }
  
  describe "GET #new" do
    let(:bands) do
      show = Show.new
      3.times{ show.bands.build } 
      show.bands
    end


    it "assigns a new show to @show" do
      get :new, params: {city_id: @city.id}
      expect(assigns(:show)).to be_a_new(Show)
    end

    it "builds three band associations in @show" do
      get :new, params: {city_id: @city.id}
      expect(assigns(:show).bands.map(&:id)).to eq bands.map(&:id)
    end

    it "renders the :new template" do
      get :new, params: {city_id: @city.id}
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    
    context "with valid attributes" do

      it "saves the new show in the database" do
        expect{
          post :create, params: {city_id: @city.id, show: attributes_for(:show, city_id: @city.id) }
        }.to change(Show, :count).by(1)
      end

      it "redirects to city#show"

    end
  
    context "with valid attributes" do

      it "does not save the new show in the database"

      it "re-renders the :new template"

    end
  
    
  end

end

require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  describe "GET #show" do
    before { @city = create(:city) }

    it "assigns the requested city to @city" do
      get :show, params: { id: @city }
      expect(assigns(:city)).to eq @city
    end

    it "renders the :show template" do
      get :show, params: { id: @city }
      expect(response).to render_template :show
    end
  end

end

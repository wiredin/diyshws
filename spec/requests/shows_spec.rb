require 'rails_helper'

RSpec.describe "Shows", type: :request do

  before do
    @city = create(:city)
    @bands = []
    3.times { |i| @bands << attributes_for(:band)}
  end

  describe "POST /cities/1/shows" do
    it "saves the new show in the database" do
      expect{
        post '/cities/1/shows', { show: attributes_for(:show, city_id: @city.id, venue: "The Alamo", start_date: "12/22/2016", start_time: "1:00", bands_attributes: @bands ) }
      }.to change(Show, :count).by(1)
    end
  end
end

require 'rails_helper'

RSpec.feature "Show City", type: :feature do

  scenario "displays the site name" do
    city = create(:city)
    visit city_path(city)
    expect(page).to have_text(city.site_name)
  end



end

require 'rails_helper'

RSpec.feature "Show City", type: :feature do

  scenario "displays the site name" do
    city = create(:city)
    visit city_path(city)
    expect(page).to have_text(city.site_name)
  end


  scenario "displays list a new show link" do
    city = create(:city)
    visit city_path(city)
    expect(page).to have_link("List a show", new_city_show_path(city_id: city.id))
  end
end

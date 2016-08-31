require 'rails_helper'

RSpec.describe City, type: :model do


  it "is valid with a name,state and site name" do
    city = City.new(
      name: "Philadelphia",
      state: "Pennsylvania",
      site_name: "PHLDiy")     
    expect(city).to be_valid
  end


  it "is invalid without a name" do
    city = City.new(name: nil)
    city.valid?
    expect(city.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a state" do
    city = City.new(state: nil) 
    city.valid?
    expect(city.errors[:state]).to include("can't be blank")
  end 
  

  it "is invalid without a sitename" do
    city = City.new(site_name: nil) 
    city.valid?
    expect(city.errors[:site_name]).to include("can't be blank")
  end 
 
  it "is invalid with a duplicate sitename" do
    City.create( name: "Phillidelphia", state: "PA", site_name: "phildiy" )
    city = City.new(name: "Providence", state: "RI", site_name: "phildiy" )
    city.valid?
    expect(city.errors[:site_name]).to include("has already been taken")
  end

   
end

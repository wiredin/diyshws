require 'rails_helper'

RSpec.describe Show, type: :model do

  it "is invalid without a start_date" do 
    show = build(:show, start_date: nil)
    show.valid?
    expect(show.errors[:start_date]).to include("can't be blank")
  end
  
  it "is invalid without a venue" do
    show = build(:show, venue: nil)
    show.valid?
    expect(show.errors[:venue]).to include("can't be blank")
  end

  it "is valid with a start_time and venue" do
    expect(build(:show)).to be_valid
  end

  it "is invalid without belonging to a City" do
    expect(build(:show)).to be_valid
  end

end

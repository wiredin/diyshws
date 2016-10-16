require 'rails_helper'

RSpec.describe Show, type: :model do

  it { is_expected.to have_many :bands }
  it { is_expected.to have_many :performances }  

  it "is invalid without a start_datetime" do 
    show = build(:show, start_datetime: nil)
    show.valid?
    expect(show.errors[:start_datetime]).to include("can't be blank")
  end
  
  it "is invalid without a venue" do
    show = build(:show, venue: nil)
    show.valid?
    expect(show.errors[:venue]).to include("can't be blank")
  end

  it "is valid with a start_time and venue" do
    expect(build(:show_with_bands)).to be_valid
  end

  it "returns 'mm/dd/yyyy' for start_date" do
    show = build(:show)
    expect(show.start_date).to eq(show.start_datetime.strftime("%m/%d/%Y"))
  end

  it "returns 'H:M' for start_date" do
    show = build(:show)
    expect(show.start_time).to eq(show.start_datetime.strftime("%H:%M"))
  end

  it "returns the expected DateTime when setting start_date and start_time" do
    show = build(:show)
    show.start_date = "10/15/2025"
    show.start_time = "20:30"
    expect(show.start_datetime).to eq("Wed, 15 Oct 2025 20:30:00 UTC +00:00")
  end
end

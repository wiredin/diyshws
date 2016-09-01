require 'rails_helper'

RSpec.describe Show, type: :model do

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
    expect(build(:show)).to be_valid
  end

  it "returns 'name of day, month and date' for the start_date" do
    show = build(:show)
    expect(show.start_date).to eq(show.start_datetime.strftime("%A, %b %d"))
  end

  describe "start_time" do
    
       
    context "is on the exact hour" do
      it "returns only the hour" do
        show = build(:show, start_datetime: DateTime.new(2018, 8, 16, 20, 0, 0) )
        expect(show.start_time).to eq(show.start_datetime.strftime("%l%P")) 
      end
    end

    context "has minutes" do
      it "returns hours and minutes" do
        show = build(:show, start_datetime: DateTime.new(2018, 8, 16, 20, 30, 0) )
        expect(show.start_time).to eq(show.start_datetime.strftime("%l:%M%P")) 
      end
    end
 
  end  

end

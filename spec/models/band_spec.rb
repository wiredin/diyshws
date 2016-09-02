require 'rails_helper'

RSpec.describe Band, type: :model do

  it { is_expected.to validate_presence_of :name  }
  it { is_expected.to validate_presence_of :country  }

  it "is valid" do
    band = build(:band)
    expect(band).to be_valid
  end   

end

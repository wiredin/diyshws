require 'rails_helper'

RSpec.describe Performance, type: :model do

  it { is_expected.to belong_to :show }
  it { is_expected.to belong_to :band }

end

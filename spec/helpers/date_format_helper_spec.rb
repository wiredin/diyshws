require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DateFormatHelper. For example:
#
# describe DateFormatHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DateFormatHelper, type: :helper do
  describe "start_time" do
    
       
    context "is on the exact hour" do
      it "returns only the hour" do
        time =  DateTime.new(2018, 8, 16, 20, 0, 0) 
        expect(print_time time).to eq(time.strftime("%l%P")) 
      end
    end

    context "has minutes" do
      it "returns hours and minutes" do
        time = DateTime.new(2018, 8, 16, 20, 30, 0) 
        expect(print_time time).to eq(time.strftime("%l:%M%P")) 
      end
    end
 
  end  

end

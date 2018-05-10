FactoryBot.define do
  factory :performance do 
    sequence(:position) {|n| n}
    band 
  end
end

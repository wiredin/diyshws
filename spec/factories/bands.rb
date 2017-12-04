FactoryBot.define do
  factory :band do |b|
    b.sequence(:name) {|n| "Eternal Fuzz#{n}"}
    b.state "NJ"
    b.country "USA"
    b.sequence(:bandcamp) {|n| "eternalfuzz#{n}"}
  end
end

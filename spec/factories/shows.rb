FactoryGirl.define do

    factory :show do
      start_datetime DateTime.current + 100
      venue "The Alamo"
      city
    end
end

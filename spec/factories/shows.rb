FactoryGirl.define do

  factory :show do
    start_datetime DateTime.current + 100
    venue "The Alamo"
    city

    factory :show_with_bands do

      transient do
        bands_count 1
      end

      after(:build) do |show,evaluator|
        evaluator.bands_count.times do
          show.bands << create(:band)
        end
      end
    end 
  end
end

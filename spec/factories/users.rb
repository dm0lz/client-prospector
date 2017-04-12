FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@site.com"
    end
  end
end

FactoryGirl.define do

  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    password "anything"
    password_confirmation "anything"
  end

  factory :project do
    sequence(:title) {|n| "Project #{n}"}
    description "A nondescript description"
  end

  factory :owned_project, :parent => :project do
    association :user
  end
    
end

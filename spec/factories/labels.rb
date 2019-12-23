FactoryBot.define do
  factory :label do
    sequence(:series) { |n| "TEST_LABEL#{n}"}
  end
end

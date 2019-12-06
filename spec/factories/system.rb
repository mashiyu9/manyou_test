FactoryBot.define do
  factory :task do
    title { "suzuki" }
    content { "hellow world"}
  end

  factory :task2, class: Task do
    title { "tarou"}
    content { "fugafuga"}
  end

  factory :task3, class: Task do
    title { "tanaka"}
    content { "hogehoge"}
  end
end
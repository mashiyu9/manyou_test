FactoryBot.define do
  factory :task do
    title { "suzuki" }
    content { "hellow world"}
    importance { 0}
    status { "完了"}
    deadline { "12/14"}
  end

  factory :task2, class: Task do
    title { "tarou"}
    content { "fugafuga"}
    importance { 1}
    status { "完了"}
    deadline { "12/12"}
  end
end

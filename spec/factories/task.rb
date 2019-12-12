FactoryBot.define do
  factory :task1, class: Task do
    id {1}
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

  factory :task3, class: Task do
    title { "tanaka"}
    content { "aaa"}
    importance {2}
    status { "完了"}
    deadline { "12/10"}
  end

end

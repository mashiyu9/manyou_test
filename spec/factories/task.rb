FactoryBot.define do
  factory :task1, class: Task do
    title { "suzuki" }
    content { "hellow world"}
    importance { 0}
    status { "完了"}
    deadline { "12-14"}
    created_at {"2001-11-10"}
  end

  factory :task2, class: Task do
    title { "tarou"}
    content { "fugafuga"}
    importance { 2}
    status { "完了"}
    deadline { "12-16"}
    created_at {"2002-11-10"}

  end

  factory :task3, class: Task do
    title { "tanaka"}
    content { "aaa"}
    importance {1}
    status { "未着手"}
    deadline { "12-10"}
    created_at {"2003-11-10"}

  end

end

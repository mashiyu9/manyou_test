FactoryBot.define do

  FactoryBot.define do
    factory :task do
      title { "suzuki" }
      content { "hellow world"}
      importance { "低"}
      status { "完了"}
      deadline { "12/14"}
    end

    factory :task2, class: Task do
      title { "tarou"}
      content { "fugafuga"}
      importance { "低"}
      status { "完了"}
      deadline { "12/12"}
    end

    factory :task3, class: Task do
      title { "tanaka"}
      content { "hogehoge"}
      importance { "低"}
      status { "完了"}
      deadline { "12/11"}
    end

    factory :task4, class: Task do
      title { "aaa"}
      content { "hogehoge"}
      importance { "低"}
      status { "完了"}
      deadline { "12/11"}
    end
  end
  factory :task_null_test1, class: Task do
    title {''}
    content {"hellow world"}
    importance {"低"}
    status {"完了"}
  end

  factory :task_null_test2, class: Task do
    title {"tarou"}
    content {""}
    status {"hellow world"}
    importance {"低"}
  end

  factory :task_null_test3, class: Task do
    title {"tanaka"}
    content {"hogehoge"}
    status {"hellow world"}
    importance {"低"}
  end

  factory :task_unique_test1, class: Task do
    title {"tanaka"}
    content {"hogehoge"}
    status {"hellow world"}
    importance {"低"}
  end
  factory :task_unique_test2, class: Task do
    title {"tanaka"}
    content {"fugafuga"}
    status {"aaaaaaaaaaaaa"}
    importance {"高"}
  end
end

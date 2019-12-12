require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
  it 'titleが空ならバリデーションが通らない' do
  @task = Task.new(
    title: "",
    content: "Brawn",
    importance: 0,
    status: "sss"
  )
  expect(@task).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
  @task = Task.new(
    title: "aaa",
    content: "",
    importance: 0,
    status: "sss"
  )
  expect(@task).not_to be_valid
  end

  it '全部埋まっていればバリデーションが通る' do
  @task = Task.new(
    title: "aaa",
    content: "aaa",
    importance: 0,
    status: "sss",
    deadline: "2019/11/10"
  )
  expect(@task).to be_valid
  end

  it 'statusが空ならバリデーションが通らない' do
  @task = Task.new(
    title: "aaa",
    content: "aaa",
    importance: 0,
    status: ""
  )
  expect(@task).not_to be_valid
  end

  it 'importanceが空ならバリデーションが通らない' do
  @task = Task.new(
    title: "aaa",
    content: "aaa",
    importance: "",
    status: "sss"
  )
  expect(@task).not_to be_valid
  end


  it "タイトルが重複するとバリデーションが通らない" do
    task = Task.create(
      title: "aaa",
      content: "aaa",
      importance: 0,
      status: "sss",
      deadline: "2099/4/2"
    )
    dup_task = Task.new(
      title: "aaa",
      content: "bbb",
      importance: 0,
      status: "sss",
      deadline: "2015/12/5"
    )
    expect(dup_task).not_to be_valid
  end

  it "入力された文字列に当てはまるタイトルを持つタスクがあるか確認" do
    task1 = create(:task)
    task2 = create(:task2)
    expect(Task.where_like_status_title("tarou", "")).to include(task2)
  end

  it "選択された状態に当てはまるタスクを確認" do
    task1 = create(:task)
    task2 = create(:task2)
    expect(Task.where_like_status_title("", "完了")).to include(task1,task2)
  end

  it "入力された文字列、状態に当てはまるタスクがあるか確認" do
    task1 = create(:task)
    task2 = create(:task2)
    expect(Task.where_like_status_title("tarou", "完了")).to include(task2)
  end

end
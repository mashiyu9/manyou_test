require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
  it 'titleが空ならバリデーションが通らない' do
  # @task = create(:task_null_test1)
  @task = Task.new(
    title: "",
    content: "Brawn",
    importance: "ttt",
    status: "sss"
  )
  expect(@task).not_to be_valid
  end

  it 'が空ならバリデーションが通らない' do
  @task = Task.new(
    title: "aaa",
    content: "",
    importance: "ttt",
    status: "sss"
  )
  expect(@task).not_to be_valid
  end

  it '全部埋まっていればバリデーションが通る' do
  @task = Task.new(
    title: "aaa",
    content: "aaa",
    importance: 0,
    status: "sss"
  )
  expect(@task).to be_valid
  end

  it 'statusが空ならバリデーションが通らない' do
  @task = Task.new(
    title: "aaa",
    content: "aaa",
    importance: "ttt",
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
      status: "sss"
    )
    dup_task = Task.new(
      title: "aaa",
      content: "bbb",
      importance: 0,
      status: "sss"
    )
    dup_task.valid?
    expect(dup_task.errors.messages[:title]).to include('はすでに存在します')
    # expect(dup_task.valid?).to eq(false)


  end

end

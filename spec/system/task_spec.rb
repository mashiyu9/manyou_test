# require 'rails_helper'
require 'byebug'
# RSpec.describe 'タスクの管理機能', type: :system do
#   # describe 'タスク一覧画面' do
#   #   context 'タスクを作成した場合' do
#   #     it '作成済みのタスクが表示されること' do
#   #       @task = Task.create(title: "testですよ")
#   #       visit index_tasks_path(@task)
#   #       expect(page).to have_content '@task'
#   #     end
#   #   end
#   describe 'タスク一覧画面' do
#     context 'タスクを作成した場合' do
#       # テストコードを it '~' do end ブロックの中に記載する
#       it '作成済みのタスクが表示されること' do
#         # テストで使用するためのタスクを作成
#         task = FactoryBot.create(:task, title: 'task')
#         # タスク一覧ページに遷移
#         visit tasks_path
#         # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
#         # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）
#         expect(page).to have_content 'task'
#         # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
#       end
#     end
#   end

#   describe 'タスク登録画面' do
#     context '必要項目を入力して、createボタンを押した場合' do
#       it 'データが保存されること' do
#         task = Task.new
#         task.title = "testです"
#         task.content = "test2です"
#         click_button 'Save'
#         expect(task.save).to be_truthy
#       end
#     end
#   end

#   describe 'タスク詳細画面' do
#     context '任意のタスク詳細画面に遷移した場合' do
#       it '該当タスクの内容が表示されたページに遷移すること' do
#         let(:task){Task.find(params)}
#         let(:params){{ title: 'test', content: 'test2'}}
#         visit = edit_task_path(task)
#       end
#     end
#   end
# end
require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  # describe 'タスク一覧画面' do
  #   context 'タスクを作成した場合' do
  #     it '作成済みのタスクが表示されること'
  #   end
  # end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      # テストコードを it '~' do end ブロックの中に記載する
      it '作成済みのタスクが表示されること' do
        # テストで使用するためのタスクを作成
        task = create(:task)
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）
        expect(page).to have_content 'testuser1'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        fill_in 'task_title', with: "テストタイトル"
        fill_in 'task_content', with: 'テストコンテンツ'
        click_button 'Create Task'
        visit tasks_path
        expect(page).to have_content 'テストタイトル'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do
        task = create(:task)
        visit task_path(task.id)
        expect(page).to have_content 'testuser1'
       end
     end
  end
end
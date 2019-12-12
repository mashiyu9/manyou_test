require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

  describe 'タスク一覧画面' do
    before do
      @task1 = create(:task)
      @task2 = create(:task2)
      @task3 = create(:task3)
    end
    # before(:each) do
    #   @request.env ||= {}

    #   name = "testuser"
    #   password = "123456"
    #   @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pass)
    # end

    # before(:each) do
    #   @request.env ||= {}
    #   name = "TESTUSER"
    #   password = "TESTPASS"
    #   @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(name, password)
    # end


    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'suzuki'
      end
    end

    context 'タスク一覧画面に遷移した時' do
      it '作成日時の降順でタスクが表記される' do
        visit tasks_path
        # debugger
        tasks = all('.task_list_parts')
        expect(tasks[0]).to have_content "tanaka"
        expect(tasks[1]).to have_content "tarou"
        expect(tasks[2]).to have_content "suzuki"
      end
    end

    context '重要度ボタンを押した時' do
      it '重要度が高い順にソートされる' do
        visit tasks_path
        tasks = all('.task_list_parts')
        expect(tasks[0]).to have_content "高"
      end
    end

    context '終了期限順ボタンを押したとき' do
      it '期限が近い順にソートされる' do
        visit tasks_path
        tasks = all('.task_list_parts')
        expect(tasks[0]).to have_content "tanaka"
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        fill_in 'task[title]', with: 'テストタイトルffffffffffff'
        fill_in 'task[content]', with: 'テストコンテンツ'
        select '高', from: 'task[importance]'
        select '完了', from: 'task[status]'
        click_button '登録する'
        visit tasks_path
        expect(page).to have_content '高'
      end
    end
  end

  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移すること' do
        task = create(:task)
        visit task_path(task.id)
        expect(page).to have_content 'suzuki'
      end
    end
  end

end
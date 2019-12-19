require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do

    @user = create(:user, password: "password")
    @admin_user = create(:user, password: "password", admin: true)

    @task1 = create(:task1, user_id: @user.id)
    @task2 = create(:task2, user_id: @user.id)
    @task3 = create(:task3, user_id: @user.id)

  end

  describe 'ログイン,ログアウト' do
    before do
      visit new_session_path
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: 'password'
      click_on 'commit'
    end

    context 'ログインしていないのにタスク一覧画面に行こうとしたとき' do
      it 'ログイン画面に飛ぶ' do
        # binding.irb
        click_on 'ログアウト'
        visit tasks_path
        expect(page).to have_content 'ログイン'
      end
    end

    context 'ログイン状態でログイン画面に行こうとしたとき' do
      it 'タスク一覧画面に戻される' do
        visit new_session_path
        expect(page).to have_content 'タスク一覧'
      end
    end

    context 'タスク詳細ページに本人以外がアクセスしたとき' do
      it 'アクセスできないように' do
        @user2 = create(:user, id: 100, password: 'password')
        visit user_path(@user2.id)
        expect(page).to have_content 'タスク一覧'
      end
    end
  end


  describe '管理画面の機能' do
    before do
      visit new_session_path
      fill_in 'session[email]', with: @admin_user.email
      fill_in 'session[password]', with: 'password'
      click_on 'commit'
    end

    context '管理者画面' do
      it 'ユーザーの一覧が表示される' do
        visit admin_users_path
        expect(page).to have_content 'ユーザー一覧'
      end

      it 'ユーザーを新規作成することができる' do
        visit new_admin_user_path
        fill_in 'user[name]', with: "testですよ"
        fill_in 'user[email]', with: "test@gmail.com" 
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'commit'
        visit admin_users_path
        expect(page).to have_content 'test@gmail.com'
      end

      it 'ユーザーを削除することができる' do
        user2 = create(:user, password: "password")
        visit admin_users_path
        num = User.all.count - 1
        all('tbody td')[6].click_link '削除'
        page.driver.browser.switch_to.alert.accept
        sleep 1
        expect(User.all.count).to eq num
      end

      it 'ユーザーを更新することができる' do
        visit admin_users_path
        all('tbody td')[5].click_link '編集'
        fill_in 'user[name]', with: "testですよ"
        fill_in 'user[email]', with: "test@gmail.com" 
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'commit'
        expect(page).to have_content "testですよ"



      end
    end

    context '管理者画面から詳細ユーザーの詳細画面に飛んだ時' do
      it 'そのユーザーの作成したタスクも表示される' do
        visit admin_user_path(@user)
        expect(page).to have_content @task1.content
      end
    end


  end


  describe 'タスク一覧画面' do

    before do
      visit new_session_path
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: 'password'
      click_on 'commit'
    end

    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'fugafuga'
      end

    end

    context 'タスク一覧画面に遷移した時' do
      it '作成日時の降順でタスクが表記される' do
        visit tasks_path
        tasks = all('.task_list_parts')
        expect(tasks[0]).to have_content "aaa"
        expect(tasks[1]).to have_content "fugafuga"
        expect(tasks[2]).to have_content "hellow world"

      end

    end

    context '重要度ボタンを押した時' do
      it '重要度が高い順にソートされる' do
        visit tasks_path
        click_on '優先度'
        all('tbody td')[5].click_link '詳細'
        expect(page).to have_content "高"
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
    before do
      visit new_session_path
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: 'password'
      click_on 'commit'
    end

    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        # binding.irb
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

        visit task_path(@task1)
        expect(page).to have_content 'hellow world'
      end
    end
  end

end
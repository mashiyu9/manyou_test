require 'rails_helper'

RSpec.describe 'ユーザーモデルのテスト', type: :model do
  it 'nameが空だとバリデーションが通らない' do
    @user = User.new(
      name: '',
      email: 'test@gmail.com',
      password: 'password'
      )
    expect(@user).not_to be_valid
  end

  it 'nameは30文字以内である' do
    @user = User.new(
      name: 'test' * 10,
      email: 'test@gmail.com',
      password: 'password'
      )
    expect(@user).not_to be_valid
  end

  it 'emailが空だとバリデーションが通らない' do
    @user = User.new(
      name: 'test',
      email: '',
      password: 'password'
      )
    expect(@user).not_to be_valid
  end

  it 'emailは255文字以内である' do
    @user = User.new(
      name: 'test',
      email: 'test' * 100,
      password: 'password'
      )
    expect(@user).not_to be_valid
  end

  it 'emailが重複していたら登録できない' do
    @user1 = User.create(
      name: 'test',
      email: 'test@gmail.com',
      password: 'password'
      )
    @user2 = User.new(
      name: 'test2',
      email: 'test@gmail.com',
      password: 'password'
      )
    expect(@user2).not_to be_valid
  end
  it 'emailが正しい形で入力されているか' do
    @user1 = User.new(
      name: 'test',
      email: '@gmail.com',
      password: 'password'
      )
    @user2 = User.new(
      name: 'test',
      email: 'test@',
      password: 'password'
    )
    @user3 = User.new(
      name: 'test',
      email: 'test@gmail',
      password: 'password'
    )
    expect(@user1).not_to be_valid
    expect(@user2).not_to be_valid
    expect(@user3).not_to be_valid
  end


  it 'passwordは6文字以上である' do
    @user = User.new(
      name: 'test',
      email: 'test',
      password: 'pass'
      )
    expect(@user).not_to be_valid
  end

end

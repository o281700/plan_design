require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '正く値が入力されていれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameが空では登録できないこと' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できないこと' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'passwordが空では登録できないこと' do
    @user.password = ''
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが５文字以下では登録できないこと' do
    @user.password = '3edc4'
    @user.password_confirmation = '3edc4'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password_confirmation = '1qaz2wsx'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end

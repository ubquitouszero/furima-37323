require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    # context '新規登録できないとき' do
    #   it 'nicknameが空では登録できない' do
    #     @user.nickname = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    #   end
    #   it 'emailが空では登録できない' do
    #     @user.email = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email can't be blank")
    #   end
    #   it 'passwordが空では登録できない' do
    #     @user.password = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end
    #   it 'passwordとpassword_confirmationが不一致では登録できない' do
    #     @user.password_confirmation = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end
    #   it 'nicknameが7文字以上では登録できない' do
    #     @user.nickname = "Faker::Name.initials(number 7)"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
    #   end
    #   it '重複したemailが存在する場合登録できない' do
    #     @user.save
    #     another_user = FactoryBot.build(:user)
    #     another_user.email = @user.email
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include('Email has already been taken')
    #   end
    #   it 'passwordが5文字以下では登録できない' do
    #     @user.password = "12345"
    #     @user.password_confirmation = "12345"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    #   end
    # end
  end
end

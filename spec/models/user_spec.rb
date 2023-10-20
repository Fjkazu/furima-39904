require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー情報全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'lastnameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'kanalast_nameが空では登録できない' do
        @user.kanalast_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanalast name can't be blank")
      end
      it 'kanafirst_nameが空では登録できない' do
        @user.kanafirst_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name can't be blank")
      end
      it 'Birthdateが空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end

      it 'lastnameが半角では登録できない' do
        @user.last_name = 'ｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'firstnameが半角では登録できない' do
        @user.first_name = 'ｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'kanalast_nameが全角カタカナ以外では登録できない' do
        @user.kanalast_name = 'A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanalast name is invalid')
      end
      it 'kanafirst_nameが全角カタカナ以外では登録できない' do
        @user.kanafirst_name = 'A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanafirst name is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a2345'
        @user.password_confirmation = 'a2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ＡｂｃｄＥｆ'
        @user.password_confirmation = 'ＡｂｃｄＥｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end


    end
  end
end

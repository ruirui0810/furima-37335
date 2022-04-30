require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

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
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'qaz123'
      @user.password_confirmation = 'qaz1234'
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
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'qaz12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '名字が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前が空だと登録できない' do
      @user.fast_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fast name can't be blank")
    end
    it '名字は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'myouji'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it '名前は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.fast_name = 'namae'
      @user.valid?
      expect(@user.errors.full_messages).to include("Fast name is invalid")
    end
    it '名字のカナが、空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it '名前のカナが、空だと登録できない' do
      @user.fast_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fast name kana is invalid")
    end
    it '名字が全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = '名字'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it '名前が全角（カタカナ）でないと登録できない' do
      @user.fast_name_kana = '名前'
      @user.valid?
      expect(@user.errors.full_messages).to include("Fast name kana is invalid")
    end
    it '生年月日が空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end

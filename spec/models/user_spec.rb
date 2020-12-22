require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全てのカラム名が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameがからでは登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "last_kanaが空では登録できないこと" do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end

    it "first_kanaが空では登録できないこと" do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end

    it "birthが空では登録できないこと" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end

    it "passwordが６文字以上かつ英数字混合であれば登録できること" do
      @user.password = "12345a"
      @user.password_confirmation = "12345a"
      expect(@user).to be_valid
    end

    it "passwordが６文字以上であっても数字だけでは登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが６文字以上であっても数字だけでは登録できないこと" do
      @user.password = "asdfgh"
      @user.password_confirmation = "asdfgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが５文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "emailが「英数字＠英数字」だと登録ができること" do
      @user.email = "123@asd"
      expect(@user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが「英数字＠」では登録ができないこと" do
      @user.email = "111@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが「＠英数字」では登録ができないこと" do
      @user.email = "@111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "ユーザー本名は全角での入力で登録ができること" do
      @user.last_name = "苗字"
      @user.first_name = "氏名"
      expect(@user).to be_valid
    end

    it "ユーザー本名（苗字）は全角での入力以外では登録ができないこと" do
      @user.last_name = "myouji"
      @user.first_name = "氏名"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "ユーザー本名（氏名）は全角での入力以外では登録ができないこと" do
      @user.last_name = "苗字"
      @user.first_name = "simei"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "ユーザー本名フリガナは全角カタカナで登録ができること" do
      @user.last_kana = "ミョウジ"
      @user.first_kana = "シメイ"
      expect(@user).to be_valid
    end

    it "ユーザー本名(苗字）フリガナは全角カタカナ入力以外では登録ができないこと" do
      @user.last_name = "myouji"
      @user.first_name = "氏名"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "ユーザー本名(氏名）フリガナは全角カタカナ入力以外では登録ができないこと" do
      @user.last_name = "ミョウジ"
      @user.first_name = "simei"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
  end
end

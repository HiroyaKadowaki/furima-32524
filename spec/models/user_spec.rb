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
      expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Eメールを入力してください")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("パスワードを入力してください" && "パスワードは不正な値です" && "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("お名前（氏）を入力してください" && "お名前（氏）全角文字を使用してください")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("お名前（名）を入力してください" && "お名前（名）全角文字を使用してください")
    end

    it "last_kanaが空では登録できないこと" do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("お名前（氏カナ）を入力してください" && "お名前（氏カナ）全角カナを使用してください")
    end

    it "first_kanaが空では登録できないこと" do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("お名前（名カナ）を入力してください" && "お名前（名カナ）全角カナを使用してください")
    end

    it "birthが空では登録できないこと" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("生年月日を入力してください")
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
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが６文字以上であっても数字だけでは登録できないこと" do
      @user.password = "asdfgh"
      @user.password_confirmation = "asdfgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが５文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください" && "パスワードは不正な値です")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません" && "パスワードは不正な値です")
    end

    it "emailが「英数字＠英数字」だと登録ができること" do
      @user.email = "123@asd"
      expect(@user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "emailが「英数字＠」では登録ができないこと" do
      @user.email = "111@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "emailが「＠英数字」では登録ができないこと" do
      @user.email = "@111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
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
      expect(@user.errors.full_messages).to include("お名前（氏）全角文字を使用してください")
    end

    it "ユーザー本名（氏名）は全角での入力以外では登録ができないこと" do
      @user.last_name = "苗字"
      @user.first_name = "simei"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（名）全角文字を使用してください")
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
      expect(@user.errors.full_messages).to include("お名前（氏）全角文字を使用してください")
    end

    it "ユーザー本名(氏名）フリガナは全角カタカナ入力以外では登録ができないこと" do
      @user.last_name = "ミョウジ"
      @user.first_name = "simei"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（名）全角文字を使用してください")
    end
  end
end

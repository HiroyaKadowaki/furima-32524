require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "nameが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品名を入力してください")
      end

      it "descriptionが空では登録できないこと" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品説明を入力してください")
      end

      it "priceが空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("値段を入力してください" && "値段は不正な値です" && "値段は数値で入力してください" && "値段は数値で入力してください")
      end

      it "burden_idが空では登録できないこと" do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送料の負担を入力してください" && "発送料の負担は数値で入力してください")
      end

      it "category_idが空では登録できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("カテゴリーを入力してください" && "カテゴリーは数値で入力してください")
      end

      it "province_idが空では登録できないこと" do
        @item.province_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送元の地域を入力してください" && "発送元の地域は数値で入力してください")
      end

      it "ship_day_idが空では登録できないこと" do
        @item.ship_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送までの日数を入力してください" && "発送までの日数は数値で入力してください")
      end

      it "state_idが空では登録できないこと" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品の状態を入力してください" && "商品の状態は数値で入力してください")
      end

      it "priceが300円未満であれば登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("値段は300以上の値にしてください")
      end

      it "priceが10000000以上であれば登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("値段は9999999以下の値にしてください")
      end

      it "priceが半角以外で入れられていると登録ができない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("値段は数値で入力してください" && "値段は数値で入力してください")
      end

      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("出品画像を入力してください")
      end

      it "burden_idが１では登録できないこと" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送料の負担は1以外の値にしてください")
      end

      it "category_idが１では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("カテゴリーは1以外の値にしてください")
      end

      it "province_idが１では登録できないこと" do
        @item.province_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送元の地域は1以外の値にしてください")
      end

      it "ship_day_idが１では登録できないこと" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送までの日数は1以外の値にしてください")
      end

      it "state_idが１では登録できないこと" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品の状態は1以外の値にしてください")
      end
    end
  end
end

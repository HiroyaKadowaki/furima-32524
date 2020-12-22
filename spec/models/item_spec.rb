require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全てのカラム名が存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it "burden_idが空では登録できないこと" do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Burden can't be blank"
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it "province_idが空では登録できないこと" do
      @item.province_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Province can't be blank"
    end

    it "ship_day_idが空では登録できないこと" do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Ship day can't be blank"
    end

    it "state_idが空では登録できないこと" do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "State can't be blank"
    end

    it "priceが300円未満であれば登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end

    it "priceが10000000以上であれば登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end

    it "priceが半角以外で入れられていると登録ができない" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end


  end
end

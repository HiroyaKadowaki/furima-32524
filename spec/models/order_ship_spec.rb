require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_ship = FactoryBot.build(:order_ship, item_id: @item.id, user_id: @user.id)
      sleep(1)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@order_ship).to be_valid
      end

      it "buidingが空白でも保存ができる" do
        @order_ship.buiding = nil
        expect(@order_ship).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "zipが空では保存できないこと" do
        @order_ship.zip = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Zip can't be blank"
      end

      it "cityが空では保存できないこと" do
        @order_ship.city = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "City can't be blank"
      end

      it "addressが空では保存できないこと" do
        @order_ship.address = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Address can't be blank"
      end

      it "phone_numberが空では保存できないこと" do
        @order_ship.phone_number = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Phone number can't be blank"
      end

      it "province_idが空では保存できないこと" do
        @order_ship.province_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Province can't be blank"
      end

      it "tokenが空では保存できないこと" do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Token can't be blank"
      end

      it "user_idが空では保存できないこと" do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "User can't be blank"
      end

      it "item_idが空では保存できないこと" do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Item can't be blank"
      end



      it "zipに-がないと登録できないこと" do
        @order_ship.zip = "0000000"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Zip is invalid. Include hyphen(-)"
      end

      it "phone_numberに-があると登録できないこと" do
        @order_ship.phone_number = "000-0000-0000"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Phone number is invalid"
      end

      it "province_idが空では登録できないこと" do
        @order_ship.province_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Province can't be blank"
      end

      it "phone_numberが11以内でないと登録できないこと" do
        @order_ship.phone_number = "000000000000"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_numberが数字でないと登録できないこと" do
        @order_ship.phone_number = "零八零零零零零零零零零"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include "Phone number is invalid"
      end
    end

  end
end

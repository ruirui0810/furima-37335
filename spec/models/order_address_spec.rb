require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'item_prefecture_idが--では登録できない' do
        @order_address.item_prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @order_address.postal_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberが9桁未満だと登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_address.phone_number = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいていなければ登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていなければ登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end
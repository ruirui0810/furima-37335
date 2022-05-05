require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品出品できるとき' do
      it 'item_name,item_info,item_category_id,item_sales_status_id,item_shipping_free_status_id,item_prefecture_id,item_scheduled_delivery_id,item_price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idが空では登録できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_free_status_idが空では登録できない' do
        @item.item_shipping_free_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping free status can't be blank")
      end
      it 'item_prefecture_idが空では登録できない' do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idが空では登録できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_category_idに「---」が選択されている場合は登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idに「---」が選択されている場合は登録できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank",)
      end
      it 'item_shipping_free_status_idに「---」が選択されている場合は登録できない' do
        @item.item_shipping_free_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping free status can't be blank")
      end
      it 'item_prefecture_idに「---」が選択されている場合は登録できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idに「---」が選択されている場合は登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceに半角数字以外が含まれている場合は登録できない' do
        @item.item_price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが300円未満では出品できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it 'item_priceが9_999_999円を超えると出品できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

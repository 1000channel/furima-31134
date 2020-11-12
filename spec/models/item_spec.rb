require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録がうまくいくとき' do
      it 'image,name,info,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_id,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまく行かないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが0では登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'sales_status_idが0では登録できない' do
        @item.sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 0')
      end
      it 'shipping_fee_status_idが0では登録できない' do
        @item.shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
      end
      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'scheduled_delivery_idが0では登録できない' do
        @item.scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 0')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999超えでは登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

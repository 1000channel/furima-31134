require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      @order_delivery = FactoryBot.build(:order_delivery)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_delivery).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_delivery.postal_code = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @order_delivery.postal_code = '0000000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが0だと保存できないこと' do
      @order_delivery.prefecture_id = 0
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'cityが空だと保存できないこと' do
      @order_delivery.city = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空だと保存できないこと' do
      @order_delivery.addresses = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @order_delivery.building = nil
      expect(@order_delivery).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @order_delivery.phone_number = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上の時は保存できないこと' do
      @order_delivery.phone_number = '000000000000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Phone number is invalid.')
    end

    it "tokenが空では登録できないこと" do
      @order_delivery.token = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
    end
  
  end
end

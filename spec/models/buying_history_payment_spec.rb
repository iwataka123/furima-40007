require 'rails_helper'

RSpec.describe BuyingHistoryPayment, type: :model do
  before do
    @buying_history_payment = FactoryBot.build(:buying_history_payment)
  end

  describe '配送先の登録' do
    context '配送先が登録できる場合' do
      it "post_code,prefecture_id,municipality,address,building,phone_numberが存在すれば登録できる" do
        expect(@buying_history_payment).to be_valid
      end
    end
    context '配送先が登録できないとき' do
      it 'post_codeが空では登録できない' do
        @buying_history_payment.post_code = ''
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it 'post_codeにハイフンが無ければ登録できない' do
        @buying_history_payment.post_code = '1114444'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが全角数字では登録できない' do
        @buying_history_payment.post_code = '１１１-２２２２'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが半角英字では登録できない' do
        @buying_history_payment.post_code = 'aaa-bbbb'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが全角英字では登録できない' do
        @buying_history_payment.post_code = 'ＡＡＡ-ＢＢＢＢ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが半角カナでは登録できない' do
        @buying_history_payment.post_code = 'ｱｱｱ-ｲｲｲ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが全角カナでは登録できない' do
        @buying_history_payment.post_code = 'アアア-イイイイ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeがひらがなでは登録できない' do
        @buying_history_payment.post_code = 'あああ-いいいい'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが漢字では登録できない' do
        @buying_history_payment.post_code = '亜亜亜-井井井井'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空では登録できない' do
        @buying_history_payment.prefecture_id = ''
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @buying_history_payment.prefecture_id = '1'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では登録できない' do
        @buying_history_payment.municipality = ''
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @buying_history_payment.address = ''
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @buying_history_payment.phone_number = ''
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberにハイフンがあると登録できない' do
        @buying_history_payment.phone_number = '111-222-3333'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁だと登録できない' do
        @buying_history_payment.phone_number = '111222333'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁だと登録できない' do
        @buying_history_payment.phone_number = '111222333444'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字では登録できない' do
        @buying_history_payment.phone_number = '１１１２２２３３３３'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角英字では登録できない' do
        @buying_history_payment.phone_number = 'aaabbbcccc'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角英字では登録できない' do
        @buying_history_payment.phone_number = 'ＡＡＡＢＢＢＣＣＣＣ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角カナでは登録できない' do
        @buying_history_payment.phone_number = 'ｱｱｱｲｲｲｳｳｳｳ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角カナでは登録できない' do
        @buying_history_payment.phone_number = 'アアアイイイウウウウ'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberがひらがなでは登録できない' do
        @buying_history_payment.phone_number = 'あああいいいうううう'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが漢字では登録できない' do
        @buying_history_payment.phone_number = '亜亜亜井井井宇宇宇宇'
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @buying_history_payment.token = nil
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない' do
        @buying_history_payment.user_id = nil
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @buying_history_payment.item_id = nil
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include("Item can't be blank")
      end
      it 'buying_historyが空では登録できない' do
        @buying_history_payment.buying_history = nil
        @buying_history_payment.valid?
        expect(@buying_history_payment.errors.full_messages).to include()
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      sleep 0.2
      item = FactoryBot.create(:item)
      sleep 0.2
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'postal_code,prefecture_id,city,addresses,building,phone_number,tokenがあれば保存ができること' do
        expect(@order).to be_valid
      end
      it 'buildingがなくても保存ができること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存ができないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code は入力必須項目です。')
      end
      it 'prefecture_idが空では保存ができないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture は入力必須項目です。')
      end
      it 'cityが空では保存ができないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('City は入力必須項目です。')
      end
      it 'addressesが空では保存ができないこと' do
        @order.addresses = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Addresses は入力必須項目です。')
      end
      it 'phone_numberが空では保存ができないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number は入力必須項目です。')
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Token は入力必須項目です。')
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.postal_code = '1112222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code は、-（ハイフン）を含めた半角数字で入力してください。')
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number は10桁~11桁の半角数字で入力してください。-（ハイフン）は入力できません。')
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture は入力必須項目です。")
      end
      it '電話番号が9桁以下では購入できない' do
        @order.phone_number = 123456789
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁~11桁の半角数字で入力してください。-（ハイフン）は入力できません。")
      end
      it '電話番号が12桁以上では購入できない' do
        @order.phone_number = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁~11桁の半角数字で入力してください。-（ハイフン）は入力できません。")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User は入力必須項目です。")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item は入力必須項目です。")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品の出品' do
    context '商品出品できるとき' do
      it 'name、info、category_id、sales_status_id、fee_status_id、prefecture_id、delivery_schedule_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Name は入力必須項目です。')
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Info は入力必須項目です。')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は入力必須項目です。')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は入力必須項目です。')
      end
      it 'sales_status_idが空では登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status は入力必須項目です。')
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status は入力必須項目です。')
      end
      it 'fee_status_idが空では登録できない' do
        @item.fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee status は入力必須項目です。')
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee status は入力必須項目です。')
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は入力必須項目です。')
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は入力必須項目です。')
      end
      it 'delivery_schedule_idが空では登録できない' do
        @item.delivery_schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery schedule は入力必須項目です。')
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_schedule_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery schedule は入力必須項目です。')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で、¥300~¥9,999,999の範囲で入力してください')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image は添付必須項目です。')
      end
      it 'priceは、¥300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で、¥300~¥9,999,999の範囲で入力してください')
      end
      it 'priceは、¥9,999,999より大きい数値では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で、¥300~¥9,999,999の範囲で入力してください')
      end
      it 'priceは、半角数字以外では保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で、¥300~¥9,999,999の範囲で入力してください')
      end
      it 'priceは、小数値では保存できない' do
        @item.price = '300.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で、¥300~¥9,999,999の範囲で入力してください')
      end
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

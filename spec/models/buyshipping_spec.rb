require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '購入情報入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyshipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyshipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @buyshipping.token = nil
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyshipping.post_code = ""
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が未選択だと保存できないこと' do
        @buyshipping.prefecture_id = ""
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Prefecture 都道府県を選択してください")
      end
      it '市町村が空だと保存できないこと' do
        @buyshipping.municipality = ""
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空と保存できないこと' do
        @buyshipping.address = ""
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyshipping.tel_number = ""
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Tel number can't be blank")
      end

      it '郵便番号はハイフンが必要なこと' do
        @buyshipping.post_code = "1234567"
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号は数字が必要なこと' do
        @buyshipping.post_code = "abc-defg"
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Post code is invalid")
      end
      it '電話番号が9桁だと保存できないこと' do
        @buyshipping.tel_number = "123456789"
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Tel number is invalid")
      end
      it '電話番号が12桁だと保存できないこと' do
        @buyshipping.tel_number = "123456789012"
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Tel number is invalid")
      end
      it '電話番号が数字以外だと保存できないこと' do
        @buyshipping.tel_number = "abcdefghijk"
        @buyshipping.valid?
        expect(@buyshipping.errors.full_messages).to include("Tel number is invalid")
      end

    end
  end
end

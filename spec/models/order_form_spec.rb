require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
      sleep(3)
    end

  describe '商品購入機能' do 
    context '商品購入できる時'
      it '必須項目の値を全て入力すると購入できる' do
        expect(@order).to be_valid
      end
      it '建物名の値がなくても購入できる' do
        @order.address2 =""
        expect(@order).to be_valid
      end
    end

      context '商品購入できない場合' do
        it '郵便番号の値が存在しない時' do
          @order.post_code = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Post code can't be blank", "Post code  Enter it as follows (e.g. 123-4567)")
        end
        it '郵便番号の値が「3桁ハイフン4桁」の半角文字列でない場合' do
          @order.post_code = "5032-204"
          @order.valid?
          expect(@order.errors.full_messages).to include("Post code  Enter it as follows (e.g. 123-4567)")
        end
        it '郵便番号の値が「数字7桁」の半角文字列の場合' do
          @order.post_code = "5032204"
          @order.valid?
          expect(@order.errors.full_messages).to include("Post code  Enter it as follows (e.g. 123-4567)")
        end
        it '都道府県の値が存在しない場合' do
          @order.prefecture_id = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Select")
        end
        it'都道府県の値が「----」の場合' do
          @order.prefecture_id = "1"
          @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture Select")
        end
        it '市区町村の値が存在しない時' do
          @order.city = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
        it '番地の値が存在しない場合' do
          @order.address1 = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Address1 can't be blank")
        end
        it '電話番号の値が存在しない場合' do
          @order.telephone = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone can't be blank")
        end
        it '電話番号の値に「-」がある場合' do
          @order.telephone = "080-3922-8832"
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone 11桁以内の数字を入力してください")
        end
        it '電話番号の値が半角数字12桁以上の場合' do
          @order.telephone = "008039228832"
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone 11桁以内の数字を入力してください")
        end
        it '電話番号の値が数字以外の場合' do
          @order.telephone = "082a35d3202"
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone 11桁以内の数字を入力してください")
        end
        it 'ユーザー情報が紐づいていない場合' do
          @order.user_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("User can't be blank")
        end
        it '商品情報が紐づいていない場合' do
          @order.item_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Item can't be blank") 
        end
        it "tokenが空では登録できないこと" do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end



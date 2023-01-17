require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do 
    context '商品登録できる時' do
      it 'image、name、description、price、condition_id、cost_id、scheduled_day_id、prefecture_id、category_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない時' do
      it '画像の値が存在しない場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名の値が存在しない場合' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明の値が存在しない場合' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '価格の値が存在しない場合' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の値が全角数字の場合' do
        @item.price = "１２８００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it '価格の値が300円以下の場合' do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格の値が10000000円以上の場合' do
        @item.price = "12680000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '「商品の状態」の値が存在しない場合' do
        @item. condition_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it '「配送料の負担」の値が存在しない場合' do
        @item.cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost Select")
      end
      it '「発送までの日数」の値が存在しない場合' do
        @item.scheduled_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day Select")
      end
      it '「発送までの日数」の値が存在しない場合' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '「カテゴリー」の値が存在しない場合' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
    end
  end
end
      





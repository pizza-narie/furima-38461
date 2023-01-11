require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do 
    context '新規登録できる時' do
      it 'nickname、email、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameの値が存在しない場合' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailの値が存在しない場合' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailの値に@が存在しない場合' do
        @user.email = 'tanjirou.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailの値が重複している場合' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordの値が存在しない場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")  
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'tanjirou021'
        @user.password_confirmation = 'tanjirou01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下の場合' do
        @user.password = '1147'
        @user.password_confirmation = '1147'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英字のみの場合' do
        @user.password = 'tanjirou'
        @user.password_confirmation = 'tanjirou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角数字のみの場合' do
        @user.password = '20100824'
        @user.password_confirmation = '20100824'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmationの値が異なる場合' do
        @user.password = 'tanjirou021'
        @user.password_confirmation = 'tanjirou0101'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameの値が存在しない場合' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")  
      end
      it 'family_nameが半角の場合' do
        @user.family_name = 'ｶﾏﾄﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角で入力してください")  
      end
      it 'family_nameが全角英字の場合' do
        @user.family_name = 'ｋａｍａｄｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角で入力してください")  
      end
      it 'first_nameの値が存在しない場合' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")  
      end
      it 'first_nameが半角の場合' do
        @user.first_name = 'ﾀﾝｼﾞﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください")  
      end
      it 'first_nameが全角英字の場合' do
        @user.first_name = 'ｋａｍａｄｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください") 
      end
      it 'family_name_kanaの値が存在しない場合' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")  
      end
      it 'family_name_kanaが半角カナの場合' do
        @user.family_name_kana = 'ﾄﾐｵｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カナで入力してください") 
      end
      it 'family_name_kanaが全角ひらがなの場合' do
        @user.family_name_kana = 'とみおか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カナで入力してください") 
      end
      it 'first_name_kanaの値が存在しない場合' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")  
      end
      it 'first_name_kanaが半角カナの場合' do
        @user.family_name_kana = 'ｷﾞﾕｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カナで入力してください") 
      end
      it 'first_name_kanaが全角ひらがなの場合' do
        @user.first_name_kana = 'ぎゆう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カナで入力してください") 
      end
      it 'birth_dayの値が存在しない場合' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")  
      end
    end
  end
end

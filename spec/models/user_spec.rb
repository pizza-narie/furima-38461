require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    let(:user){
      User.new(
        nickname: nickname, 
        email: email, 
        password: password, 
        password_confirmation: password_confirmation, 
        birth_day: "2001-1-11", 
        family_name: "竈門",
        first_name: "炭治郎",
        family_name_kana: "カマド",
        first_name_kana: "タンジロウ"
      )
    }
    let(:nickname){"タロウ"}
    let(:email){"alice@sample.com"}
    let(:password){"1234hanako"}
    let(:password_confirmation){"1234hanako"}
    describe "nickname" do
      context "入力値が存在しない場合" do
        let(:nickname){""}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "入力値が存在する場合" do
        it "trueが返ってくる" do
          expect(user.valid?).to be_truthy
        end
      end
    end
    describe "email" do
      context "入力値が存在しない場合" do
        let(:email){""}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "正しい値の場合" do
        it "trueが返ってくる" do
          expect(user.valid?).to be_truthy
        end
      end
      context "入力値に@が存在しない場合" do
        let(:email){"alice.com"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "入力値が重複している場合" do
        before do
          User.create!(
            nickname: "ネズコ", 
            email: email, 
            password: "00000nezuko", 
            password_confirmation: "00000nezuko", 
            birth_day: "2001-1-12", 
            family_name: "我妻",
            first_name: "善逸",
            family_name_kana: "アガツマ",
            first_name_kana: "ゼンイツ"
          )
        end
        let(:email){"nezuko@sample.com"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
    end
    describe "password" do
      context "入力値が存在しない場合" do
        let(:password){""}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "入力値が存在する場合" do
        it "trueが返ってくる" do
          expect(user.valid?).to be_truthy
        end
      end
      context "5文字以下の場合" do
        let(:password){"123oi"}
        let(:password_confirmation){"123oi"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "半角英字のみの場合" do
        let(:password){"oioioi"}
        let(:password_confirmation){"oioioi"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "半角数字のみの場合" do
        let(:password){"123456"}
        let(:password_confirmation){"123456"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
      context "値が異なる場合" do
        let(:password){"123kuou"}
        let(:password_confirmation){"124mete"}
        it "falseが返ってくる" do
          expect(user.valid?).to be_falsey
        end
      end
    end
  end
end

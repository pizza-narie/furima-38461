class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 
  
  with_options presence: true do

    validates :nickname
    validates :birth_day
    validates :password, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }, confirmation: true 
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください"}
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "は全角カナで入力してください"}

  end

  has_many :items
  has_many :orders
end


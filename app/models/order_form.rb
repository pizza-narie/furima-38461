class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address1, :address2, :telephone, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: " Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A0\d{9,10}\z/, message: '10桁以上11桁以内の半角数字を入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    validates :token
    validates :user_id
    validates :item_id
  end

   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    order.create_address(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, 
                   telephone: telephone)
  end
end
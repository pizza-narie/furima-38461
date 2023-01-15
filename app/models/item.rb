class Item < ApplicationRecord
  validates :name,                 presence: true
  validates :description,          presence: true
  validates :price,                presence: true
  validates :condition_id,         presence: true
  validates :cost_id,              presence: true
  validates :scheduled_day_id,     presence: true
  validates :prefecture_id,        presence: true
  validates :category_id,          presence: true

  belongs_to :user
  #has_one :order

end


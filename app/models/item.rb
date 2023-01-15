class Item < ApplicationRecord
  validates :name,                                              presence: true
  validates :description,                                       presence: true
  validates :price,                                             presence: true
  validates :condition_id, numericality: { other_than: 1 },     presence: true
  validates :cost_id,                                           presence: true
  validates :scheduled_day_id,                                  presence: true
  validates :prefecture_id,                                     presence: true
  validates :category_id, numericality: { other_than: 1 },      presence: true

  belongs_to :user
  #has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :scheduled_day

end


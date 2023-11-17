class Item < ApplicationRecord

  has_one_attached :image

  has_one :buying_history

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :name,              presence: true
  validates :explanation,       presence: true
  validates :price,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,             presence: true

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
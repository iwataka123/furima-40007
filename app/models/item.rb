class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :name,              presence: true
  validates :explanation,       presence: true
  validates :price,             presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/}
  validates :image,             presence: true

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
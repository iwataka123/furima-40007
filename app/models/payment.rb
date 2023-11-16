class Payment < ApplicationRecord

  belongs_to :prefecture
  belongs_to :buying_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # validates :post_code,      presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  # validates :municipality,   presence: true
  # validates :address,        presence: true
  # validates :phone_number,   presence: true, format: { with: /\A\d{10,11}\z/ }

  # with_options numericality: { other_than: 1 , message: "can't be blank"} do
  #   validates :prefecture_id
  # end
end
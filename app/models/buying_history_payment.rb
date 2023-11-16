class BuyingHistoryPayment
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :buying_history, :user_id, :item_id

  with_options presence: true do
    validates :post_code,     format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number,  format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :prefecture_id
  end

  def save
    buying_history = BuyingHistory.new(user_id: user_id)
    buying_history.item = Item.find(item_id)
    buying_history.save
    Payment.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, buying_history_id: buying_history.id)
  end
end
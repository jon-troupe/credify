class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :number, presence: true
  validates :pin, presence: true
  validates :date, presence: true
  validates :card_type, presence: true
  validates :card_issuer, presence: true
  validates :credit_limit, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :cardholder, presence: true
  validates :number, length: { is: 8 }
  validates :card_type, inclusion: { in: ["Costco", "Triangle", "VISA", "Mastercard", "AMEX"],
    message: "%{value} is not a card type" }
  validates :card_issuer, inclusion: { in: ["BMO", "Scotiabank", "Bank of America", "Swiss Credit Union", "TD", "Desjardins"],
    message: "%{value} is not a card issuer" }
  validates :credit_limit, length: { in: 3..10 }
  validates :price_per_day, length: { in: 1..5 }
end

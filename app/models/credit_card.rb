class CreditCard < ApplicationRecord
  ISSUERS = ["BMO", "Scotiabank", "Bank of America", "Swiss", "Credit Union", "TD", "Desjardins"].freeze
  CARD_TYPE = ["Costco", "Triangle", "VISA", "Mastercard", "AMEX", "Discover"].freeze

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
  validates :card_type, inclusion: { in: CARD_TYPE }
  validates :card_issuer, inclusion: { in: ISSUERS }
  validates :credit_limit, length: { in: 3..10 }
  validates :price_per_day, length: { in: 1..5 }
end

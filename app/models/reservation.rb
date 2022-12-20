class Reservation < ApplicationRecord
  belongs_to :credit_card
  belongs_to :user
  validates :end_date, comparison: { greater_than: :start_date }
end

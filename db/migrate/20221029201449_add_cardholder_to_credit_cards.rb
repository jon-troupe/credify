class AddCardholderToCreditCards < ActiveRecord::Migration[7.0]
  def change
    add_column :credit_cards, :cardholder, :string
  end
end

class AddCoordinatesToCreditCards < ActiveRecord::Migration[7.0]
  def change
    add_column :credit_cards, :latitude, :float
    add_column :credit_cards, :longitude, :float
  end
end

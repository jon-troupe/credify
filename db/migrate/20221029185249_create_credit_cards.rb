class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :pin
      t.string :date
      t.string :card_type
      t.string :card_issuer
      t.integer :credit_limit
      t.string :address
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

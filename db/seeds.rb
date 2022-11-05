require 'faker'

CreditCard.destroy_all

100.times do
  CreditCard.create!(
    cardholder: Faker::Name.name,
    number:Faker::Bank.account_number(digits: 8),
    pin: Faker::Bank.account_number(digits: 4),
    card_type: CreditCard::CARD_TYPE.sample,
    card_issuer: CreditCard::ISSUERS.sample,
    credit_limit: Faker::Number.number(digits: 4),
    date: "#{(1..12).to_a.sample}/#{(23..28).to_a.sample}",
    address: Faker::Address.street_address,
    price_per_day: (50..200).to_a.sample,
    user_id: 1
  )
end

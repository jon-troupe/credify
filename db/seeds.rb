require 'faker'

Reservation.destroy_all
p "Destroying reservations"
CreditCard.destroy_all
p "Destroying all your credits cards :("
User.destroy_all
p "Destroying all your users"

ricky = User.create!(
  email: "ricky.tran@gmail.com",
  password: "123456"
)

laura = User.create!(
  email: "laura.gonzalez@gmail.com",
  password: "123456"
)

touhami = User.create!(
  email: "touhami.abi@gmail.com",
  password: "123456"
)

jon = User.create!(
  email: "jonathan.troupe@gmail.com",
  password: "123456"
)

p "Users created"

33.times do
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
    user: laura
  )
end

33.times do
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
    user: touhami
  )
end

33.times do
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
    user: jon
  )
end

p "Credit cards created"

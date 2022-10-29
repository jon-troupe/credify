require 'faker'

50.times do
  User.create!(
    email: Faker::Internet.email,
    encrypted_password: Faker::Alphanumeric.alphanumeric(number: 15, min_alpha: 7, min_numeric: 3)
  )
end

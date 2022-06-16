# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'creating 50 scores, 50 users and 50 loan proposals'
50.times do
  user = User.create!(
    email: Faker::Internet.email,
    role: 'farmer',
    password: '123456'
  )

  Score.create!(
    annual_income: Faker::Number.number(digits: 10),
    crop: Faker::Food.vegetables,
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    risk: ['Alto', 'Médio', 'Baixo'].sample,
    user_id: user.id
  )

  x = Array(1..10).sample
  y = [100, 350, 500, 660, 800, 4300, 10000].sample
  z = x * y

  LoanProposal.create!(
    conditions: "#{Array(1..36).sample}x",
    description: Faker::Lorem.sentence,
    amount: z,
    accepted: 'Em Análise',
    user_id: user.id
  )
end
puts 'that´s it'

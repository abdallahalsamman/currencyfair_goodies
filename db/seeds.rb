require 'faker'

puts "Adding transactions to db"
puts "This might take up to a minute..."
10_000.times do
  Transaction.create(:user_id => Faker::Number.number(6), :currency_from => Faker::Currency.code, :currency_to => Faker::Currency.code,
                     :amount_sell => Faker::Number.between(1, 10_000), :amount_buy => Faker::Number.between(1, 10_000),
                     :rate => Faker::Number.decimal(0, 4).to_f * 10, :time_placed => Faker::Date.between(10.years.ago, Date.today).to_s,
                     :originating_country => Faker::Address.country_code)
end
puts "10,000 transactions added to db :)\n"

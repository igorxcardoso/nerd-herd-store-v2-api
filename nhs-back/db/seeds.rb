# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

start = DateTime.now
p "Starting rake: #{start}"


# Products and Stocks

10.times do |i|
    Product.create(title: Faker::Device.model_name,
                    code_bar: Faker::Barcode.ean,
                    description: Faker::TvShows::SouthPark.quote,
                    price_unit: Faker::Number.decimal(l_digits: 3, r_digits: 3)
    )
end
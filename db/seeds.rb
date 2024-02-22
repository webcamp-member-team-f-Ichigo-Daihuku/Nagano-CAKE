# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "a@a",
  password: "aaaaaa"
  )

# 20.times do |n|
#   Public.create!(
#     email: "p#{n + 1}@p",
#     password: "pppppp",
#     last_name: "試験",
#     first_name: "人員#{n + 1}",
#     last_name_kane: "テスト",
#     first_name_kana: "ユーザー#{n + 1}",
#     postal_code: "1111111",
#     address: "東京",
#     telephone_number: "11111111111",
#     )
#   end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

news_csv = CSV.readlines("db/news.csv")
news_csv.shift
news_csv.each do |row|
  News.create(name: row[0], text: row[1], tag: row[2], link: row[3], bookmark: row[4],
    quotation: row[5], comment: row[6], picture: row[7])
end

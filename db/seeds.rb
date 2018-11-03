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
  News.create(name: row[1], text: row[2], tag: row[3], link: row[4], bookmark: row[5],
    created_at: row[6], updated_at: row[7], quotation: row[8], comment: row[9], picture: row[10])
end

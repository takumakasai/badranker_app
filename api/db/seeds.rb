# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# create_table :users do |t|
#   t.string  :name
#   t.string  :email
#   t.integer :rank
#   t.string  :status

#   t.timestamps

User.create(name: "ブラハ", email: "test", rank: 1, status: "1", display_id: '1111', password: "1111", play_style: "receive", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技1")
User.create(name: "ライフライン", email: "test", rank: 2, status: "1", display_id: '2222', password: "2222", play_style: "attack", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-")
User.create(name: "オクタン", email: "test", rank: 3, status: "1", display_id: '3333', password: "3333", play_style: "attack", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技3")
User.create(name: "ジブラルタル", email: "test", rank: 4, status: "1", display_id: '4444', password: "4444", play_style: "balance", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技2")
User.create(name: "よしひこ", email: "test", rank: 5, status: "1", display_id: '5555', password: "5555", play_style: "balance", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-")
User.create(name: "パス", email: "test", rank: 6, status: "1", display_id: '6666', password: "6666", play_style: "receive", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-")



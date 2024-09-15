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

User.create(name: "Aさん", email: "test", rank: 1, status: "1")
User.create(name: "Bさん", email: "test", rank: 2, status: "1")
User.create(name: "Cさん", email: "test", rank: 3, status: "1")
User.create(name: "Dさん", email: "test", rank: 4, status: "1")
User.create(name: "Eさん", email: "test", rank: 5, status: "1")
User.create(name: "Fさん", email: "test", rank: 6, status: "1")




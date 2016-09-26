# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(name: "Mike Mullen", email: "mmullen227@gmail.com", password:"1234567", password_confirmation: "1234567", role: "admin")
user_2 = User.create!(name: "Johnny AppleSeed", email: "johnnyappleseed@gmail.com", password:"123456", password_confirmation: "123456", role: "employee")
user_3 = User.create!(name: "Roger Rabbit", email: "rogerrabbit@gmail.com", password:"123456", password_confirmation: "123456", role: "subcontractor")

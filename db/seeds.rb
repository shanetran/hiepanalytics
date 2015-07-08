# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'tranhiep92@gmail.com', 
             password: 'tranduchiep', 
             password_confirmation: 'tranduchiep')
User.create!(email: 'hongtham.tran90@gmail.com', 
             password: 'tranthihongtham', 
             password_confirmation: 'tranthihongtham')
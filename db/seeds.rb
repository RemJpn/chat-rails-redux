# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"
Message.destroy_all
User.destroy_all
Channel.destroy_all

puts "Seeding Channels"
general = Channel.create!( name: "general")
paris = Channel.create!( name: "paris")
react = Channel.create!( name: "react")

puts "Seeding users"
robert = User.create!( email: "rob@tracteur.com", password: "123456")
jeanmi = User.create!( email: "jeanmi@tunnning.com", password: "123456")
justin = User.create!( email: "justin@crymeariver.com", password: "123456")

puts "Seeding messages"
message1 = Message.new(content: "Cool ce site")
message1.user = robert
message1.channel = general
message1.save!

message2 = Message.new(content: "Oui j'avoue")
message2.user = justin
message2.channel = general
message2.save!

message3 = Message.new(content: "recherche renault R5 rouge pas cher")
message3.user = jeanmi
message3.channel = paris
message3.save!


message4 = Message.new(content: "ya qq ici?")
message4.user = jeanmi
message4.channel = react
message4.save!

message5 = Message.new(content: "pas de reaction...")
message5.user = jeanmi
message5.channel = react
message5.save!


# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

marios = User.create(username: 'marios')
kubilay = User.create(username: 'kubilay')
frank = User.create(username: 'frank')
taofeek = User.create(username: 'taofeek')
Iryn = User.create(username: 'Iryn')
marios.opinions.create(text: "Lets talk about rock'n'roll guys!")
kubilay.opinions.create(text: "I'm a huge fan of Led Zeppelin!")
taofeek.opinions.create(text: "I grew up with Black Sabbath!")
frank.opinions.create(text: "No matter what rock'n'roll will never die!")
marios.opinions.create(text: "It's ok to here some old bands but I prefer to hear heavy metal!")

puts 'seeded'
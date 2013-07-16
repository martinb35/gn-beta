# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{name: 'Administrador'},{name: 'Editor'},{name: 'Usuario'}])
User.create([
  { name: 'sw-admin', 
    password: 'Mida8lie',
    password_confirmation: 'Mida8lie',
    email: 'sales@semantic.mx', 
    role_id: 1},
  { name: 'goninis', 
    password: 'ooquai1O',
    password_confirmation: 'ooquai1O',
    email: 'goninis@gmail.com', 
    role_id: 2},
  { name: 'Carlos', 
    password: 'footoh7H',
    password_confirmation: 'footoh7H',
    email: 'test@semantic.mx', 
    role_id: 3}
])

Level.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
Floor.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
Room.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
Bathroom.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
JobCategory.create([{title: 'Hogar', icon: 'house.png'}, {title: 'Profesionales', icon: 'building.png'}])

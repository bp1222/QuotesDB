# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Right.create([
    {right_name: 'admin'},
    {right_name: 'quote_create'},
    {right_name: 'quote_edit'},
    {right_name: 'quote_delete'},
    {right_name: 'user_create'},
    {right_name: 'user_edit'},
    {right_name: 'user_delete'}
  ]
)

Role.create({role_name: 'Administrator'}).rights << Right.find_by(right_name: 'admin')
Role.create({role_name: 'User'}).rights << Right.where('right_name like "user%"')

User.create({name: 'Admin User', username: 'admin', password: 'password', password_confirmation: 'password'}).roles << Role.find_by(role_name: 'Administrator')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{name: 'Bronx', email: 'Bronx@yahoo.com', tel: '3109793322', location: 'WLA', school: 'Berkshire'},
  {name: 'Charlie Brown', email: 'Charlie@yahoo.com', tel: '3102223333', location: 'Santa Monica', school: 'Samo High'}])

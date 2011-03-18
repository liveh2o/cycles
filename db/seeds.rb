# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

App.create([{ name: 'Project(Serve)' }, { name: 'Reach' }, { name: 'Sprout' }])
Person.create(name: 'Adam H',email: 'adam@test.co')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Make admin user
#
admin = User.new
admin.email = "admin@localhost.com"
admin.password = "adminadmin"
admin.group = "admin"
admin.save

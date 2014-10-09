# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{	email: "brandonjyuhas@gmail.com",
		password: "password",
		zipcode: 21157,
		cell: 4436054113,
		max_temp: 67,
		min_temp:  66 },
	{	email: "paul@tester.com",
		password: "password",
		zipcode: 90003,
		cell: 7039890535,
		max_temp: 30,
		min_temp: 29 },
	{ email: "liz@tester.com",
		password: "password",
		zipcode: 75006,
		cell: 7032315273,
		max_temp: 77,
		min_temp: 50 },
	{ email: "stephen@tester.com",
		password: "password",
		zipcode: 73101,
		cell: 5712967102,
		max_temp: 10,
		min_temp: 20 }
		])

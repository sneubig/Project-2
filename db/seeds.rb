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
		cell: 4436054113 },
	{	email: "test@tester.com",
		password: "password",
		zipcode: 21212,
		cell: 4102122222 },
	{ 	email: "jokes@on.you",
		password: "password",
		zipcode: 12345,
		cell: 2123453423 },
		])

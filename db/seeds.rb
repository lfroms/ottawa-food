# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Lukas Romsicki", email: "lukas@romsicki.com")

Restaurant.create(yelp_id: "beckta-dining-and-wine-ottawa-2")
Restaurant.create(yelp_id: "sansotei-ramen-ottawa")

Favorite.create(user_id: 1, restaurant_id: 1)
Favorite.create(user_id: 1, restaurant_id: 2)
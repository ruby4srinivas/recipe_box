# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# srinivas = User.create! email: 'srini2@yahoo.com', password: '12345678'
# dhanush = User.create! email: 'dhanush2@yahoo.com', password: '12345678'

saggu = Recipe.create! title: 'paramannam', description: 'Sabudana vada recipe is an addictive, tasty and easy to make Indian snack. It is a popular Maharashtrian snack prepared with sago aka tapioca pearls and is made during for fasting days (vrat). Down South it is called sagubiyyam vadalu in telugu and javvarisi vadai in tamil. Roasted peanuts is an essential ingredient in sabudana vada which has a crispy exterior and a soft interior. Its a perfect fasting food to make during vrat if the entire family is on fast keeping in mind it is a kid friendly snack. It can also be served as finger food/starter for parties or as an evening snack with a cup of chai.

While preparing sabudana vada recipe, ensure you use good quality medium or large sized sago pearls and do not soak them in water. If soaked in water, they will asborb a lot of oil while being deep fried. Its best to allow the washed sago to sit in a few tablespoons of water for one or two hours. Do check out more sabudana recipes for fasting days like Mahashivaratri or Navratri.', user_id: 3

vada = Recipe.create! title: 'vada' , description: 'you are here: home / kids recipes / sabudana khichdi recipe, how to make sabudana khichdi for fasting vrat
sabudana khichdi recipe, how to make sabudana khichdi for fasting vrat
january 18, 2016 by dassana amit 101 comments

how-to-make-sabudana-khichdi-recipe
76Share
5.3kShare
Tweet
821Pin
sabudana khichdi recipe with step by step photos – sabudana khichdi is usually made during fasting days like navratri or mahashivratri or ekadashi. sabudana khichdi is an easy snack and is a good recipe to be made during fasting days but it requires little experience to get the perfect texture in the sabudana pearls.

when you make the sabudana khichdi, you have to adjust the soaking time as per the type of tapioca pearls. for some pearls 2 to 3 hours is fine. for some you don’t even need to soak them in water.. just cover the pearls with water for some time and you are done. so do soak the sabudana pearls accordingly.',user_id: 4

Ingredient.create! name: 'Salt', recipe_id: vada
Ingredient.create! name: 'Sabdhan', recipe_id: vada
Ingredient.create! name: 'Sugar', recipe_id: vada

Ingredient.create! name: 'chilli powder', recipe_id: saggu
Ingredient.create! name: 'ginger', recipe_id: saggu
Ingredient.create! name: 'garlic', recipe_id: saggu

Direction.create! step: 'Add chilli',recipe_id: 'saggu'
Direction.create! step: 'Add garlic',recipe_id: 'saggu'
Direction.create! step: 'Add ginger',recipe_id: 'saggu'

Direction.create! step: 'Add chilli',recipe_id: 'vada'
Direction.create! step: 'Add garlic',recipe_id: 'vada'
Direction.create! step: 'Add ginger',recipe_id: 'vada'
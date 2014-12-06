# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Dummy User
UserAccount.create(first_name: "test_first_name1", last_name: "test_last_name1", email: "test_email1", user_name: "test1", password: "1234")
UserAccount.create(first_name: "test_first_name2", last_name: "test_last_name2", email: "test_email2", user_name: "test2", password: "1234")
# Populating Weight Type
floz = WeightType.create(type_of_weight: "liquid", measure_type: "fl-oz")
units = WeightType.create(type_of_weight: "solid", measure_type: "unit")
ounces = WeightType.create(type_of_weight: "solid", measure_type: "ounces")
grams = WeightType.create(type_of_weight: "solid", measure_type: "grams")

# Populating Step Listing
Step.create(step_description: "Mix in")
Step.create(step_description: "Add After Mixing")
Step.create(step_description: "Coat Rim with Ingredient")
Step.create(step_description: "Garnish")


# Populating Ingredient Listing
Ingredient.create(ingredient_name: "Generic Vodka", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Rum", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Gin", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Tequila", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Bourbon", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Scotch", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Whiskey", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Brandy", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Triple Sec", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Maraschino Liquer", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Coffee Liquer", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Creme de Cassis", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Creme de Cacao", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Dry Vermouth", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Sweet Vermouth", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Campari", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Angostura Bitters", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Orange Bitters", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Syrup", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Generic Grenadine", weight_type_id: floz.id)
Ingredient.create(ingredient_name: "Ice Rock", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Ice cube", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Lemon", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Lime", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Mint", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Orange", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Salt", weight_type_id: grams.id)
Ingredient.create(ingredient_name: "Pepper", weight_type_id: grams.id)
Ingredient.create(ingredient_name: "Sugar", weight_type_id: grams.id)
Ingredient.create(ingredient_name: "Sugar cube", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Cherry", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Apple", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Olive", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Umbrella", weight_type_id: units.id)
Ingredient.create(ingredient_name: "Pick", weight_type_id: units.id)


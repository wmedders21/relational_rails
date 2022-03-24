# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BladeSmith.destroy_all
Blade.destroy_all

blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)

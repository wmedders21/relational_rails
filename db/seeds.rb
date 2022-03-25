# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BladeSmith.destroy_all
Blade.destroy_all

@blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
@blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
@blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
@blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
@blade_1 = @blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
@blade_2 = @blade_smith_2.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
@blade_3 = @blade_smith_2.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
@blade_4 = @blade_smith_3.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
@blade_5 = @blade_smith_3.blades.create!(model: "Throwing Knife", length: 155, blade_material: "High Carbon Steel", handle_material: "High Carbon Steel", available: false)
@blade_6 = @blade_smith_3.blades.create!(model: "Stiletto", length: 200, blade_material: "High Carbon Steel", handle_material: "Walnut", available: false)
@blade_7 = @blade_smith_4.blades.create!(model: "Mini Fighter", length: 175, blade_material: "Stainless", handle_material: "Stacked Leather", available: false)
@blade_8 = @blade_smith_4.blades.create!(model: "Hunter", length: 200, blade_material: "Tool Steel", handle_material: "Composite", available: true)
@blade_9 = @blade_smith_4.blades.create!(model: "Letter Opener", length: 170, blade_material: "High Carbon Steel", handle_material: "Ebony", available: false)
@blade_10 = @blade_smith_4.blades.create!(model: "U.S.M.C.", length: 301, blade_material: "High Carbon Steel", handle_material: "Stacked Leather", available: false)

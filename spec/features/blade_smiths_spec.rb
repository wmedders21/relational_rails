require 'rails_helper'

RSpec.describe 'blade smiths index page', type: :feature do
  it 'displays the name of each blade smith' do
    blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
    visit '/blade_smiths'
    # save_and_open_page
    expect(page).to have_content(blade_smith_1.name)
    expect(page).to have_content(blade_smith_2.name)
    expect(page).to have_content(blade_smith_3.name)
    expect(page).to have_content(blade_smith_4.name)
  end

  it 'displays blade smiths in order most recently created' do
    blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
    visit '/blade_smiths'
    # save_and_open_page
    expect(blade_smith_4.name).to appear_before(blade_smith_3.name)
    expect(blade_smith_3.name).to appear_before(blade_smith_2.name)
    expect(blade_smith_2.name).to appear_before(blade_smith_1.name)
  end
end

RSpec.describe 'blade smiths show page', type: :feature do
  it 'displays the blade smith with corresponding id with all attributes' do
    blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
    visit "/blade_smiths/#{blade_smith_1.id}"
    # save_and_open_page
    expect(page).to have_content(blade_smith_1.name)
    expect(page).to have_content(blade_smith_1.state)
    expect(page).to have_content(blade_smith_1.avg_yearly_output)
    expect(page).to have_content(blade_smith_1.hand_forger)
    expect(page).to have_content(blade_smith_1.created_at)
    expect(page).to have_content(blade_smith_1.updated_at)
    expect(page).to have_content(blade_smith_1.id)
  end

  it 'displays the number of Blades associated with each BladeSmith' do
    blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
    blade_1 = blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    blade_2 = blade_smith_2.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    blade_3 = blade_smith_2.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    blade_4 = blade_smith_3.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
    blade_5 = blade_smith_3.blades.create!(model: "Throwing Knife", length: 155, blade_material: "High Carbon Steel", handle_material: "High Carbon Steel", available: false)
    blade_6 = blade_smith_3.blades.create!(model: "Stiletto", length: 200, blade_material: "High Carbon Steel", handle_material: "Walnut", available: false)
    blade_7 = blade_smith_4.blades.create!(model: "Mini Fighter", length: 175, blade_material: "Stainless", handle_material: "Stacked Leather", available: false)
    blade_8 = blade_smith_4.blades.create!(model: "Hunter", length: 200, blade_material: "Tool Steel", handle_material: "Composite", available: true)
    blade_9 = blade_smith_4.blades.create!(model: "Letter Opener", length: 170, blade_material: "High Carbon Steel", handle_material: "Ebony", available: false)
    blade_10 = blade_smith_4.blades.create!(model: "U.S.M.C.", length: 301, blade_material: "High Carbon Steel", handle_material: "Stacked Leather", available: false)

    visit "/blade_smiths/#{blade_smith_1.id}"
    expect(page).to have_content(blade_smith_1.model_count)
    visit "/blade_smiths/#{blade_smith_2.id}"
    expect(page).to have_content(blade_smith_2.model_count)
    visit "/blade_smiths/#{blade_smith_3.id}"
    expect(page).to have_content(blade_smith_3.model_count)
    visit "/blade_smiths/#{blade_smith_4.id}"
    expect(page).to have_content(blade_smith_4.model_count)
  end
end

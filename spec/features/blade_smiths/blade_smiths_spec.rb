require 'rails_helper'

RSpec.describe 'blade smiths index page', type: :feature do
  before :each do
    Blade.destroy_all
    BladeSmith.destroy_all
    @blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    @blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    @blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    @blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
  end
  it 'displays the name of each blade smith' do
    visit '/blade_smiths'
    expect(page).to have_content(@blade_smith_1.name)
    expect(page).to have_content(@blade_smith_2.name)
    expect(page).to have_content(@blade_smith_3.name)
    expect(page).to have_content(@blade_smith_4.name)
  end

  it 'displays blade smiths in order most recently created' do
    visit '/blade_smiths'
    expect(@blade_smith_4.name).to appear_before(@blade_smith_3.name)
    expect(@blade_smith_3.name).to appear_before(@blade_smith_2.name)
    expect(@blade_smith_2.name).to appear_before(@blade_smith_1.name)
  end

  it 'has a link to the Blades index at the top' do
    visit "/blade_smiths"
    expect(page).to have_link(nil, href: '/blades')
  end

  it 'has a link to the BladeSmiths index at the top' do
    visit "/blade_smiths"
    expect(page).to have_link(nil, href: '/blade_smiths')
  end

  it 'has a link to BladeSmiths new' do
    visit "/blade_smiths"
    expect(page).to have_link(nil, href: '/blade_smiths/new')
  end

  it 'has links to update each bladesmith' do
    visit "/blade_smiths"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_1.id}/edit")
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_2.id}/edit")
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_3.id}/edit")
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_4.id}/edit")
    click_link("Update #{@blade_smith_1.name}")
    expect(current_path).to eq("/blade_smiths/#{@blade_smith_1.id}/edit")
  end

  it 'has links to delete each bladesmith' do
    visit "/blade_smiths"
    expect(page).to have_content("#{@blade_smith_1.name}")
    expect(page).to have_content("#{@blade_smith_2.name}")
    expect(page).to have_content("#{@blade_smith_3.name}")
    expect(page).to have_content("#{@blade_smith_4.name}")
    click_link("Delete #{@blade_smith_1}")
    expect(current_path).to eq('/blade_smiths')
    expect(page).to have_no_content("#{@blade_smith_1.name}")
    click_link("Delete #{@blade_smith_2}")
    expect(page).to have_no_content("#{@blade_smith_2.name}")
    click_link("Delete #{@blade_smith_3}")
    expect(page).to have_no_content("#{@blade_smith_3.name}")
    click_link("Delete #{@blade_smith_4}")
    expect(page).to have_no_content("#{@blade_smith_4.name}")
  end
end

RSpec.describe 'blade smiths show page', type: :feature do
  before :each do
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
  end

  it 'displays the blade smith with corresponding id with all attributes' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_content(@blade_smith_1.name)
    expect(page).to have_content(@blade_smith_1.state)
    expect(page).to have_content(@blade_smith_1.avg_yearly_output)
    expect(page).to have_content(@blade_smith_1.hand_forger)
    expect(page).to have_content(@blade_smith_1.created_at)
    expect(page).to have_content(@blade_smith_1.updated_at)
    expect(page).to have_content(@blade_smith_1.id)
  end

  it 'displays the number of Blades associated with each BladeSmith' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_content(@blade_smith_1.model_count)
    visit "/blade_smiths/#{@blade_smith_2.id}"
    expect(page).to have_content(@blade_smith_2.model_count)
    visit "/blade_smiths/#{@blade_smith_3.id}"
    expect(page).to have_content(@blade_smith_3.model_count)
    visit "/blade_smiths/#{@blade_smith_4.id}"
    expect(page).to have_content(@blade_smith_4.model_count)
  end

  it 'has a link to the Blades index at the top' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_link(nil, href: '/blades')
    visit "/blade_smiths/#{@blade_smith_2.id}"
    expect(page).to have_link(nil, href: '/blades')
    visit "/blade_smiths/#{@blade_smith_3.id}"
    expect(page).to have_link(nil, href: '/blades')
    visit "/blade_smiths/#{@blade_smith_4.id}"
    expect(page).to have_link(nil, href: '/blades')
  end

  it 'has a link to the BladeSmiths index at the top' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_link(nil, href: '/blade_smiths')
    visit "/blade_smiths/#{@blade_smith_2.id}"
    expect(page).to have_link(nil, href: '/blade_smiths')
    visit "/blade_smiths/#{@blade_smith_3.id}"
    expect(page).to have_link(nil, href: '/blade_smiths')
    visit "/blade_smiths/#{@blade_smith_4.id}"
    expect(page).to have_link(nil, href: '/blade_smiths')
  end

  it 'has a link to the BladeSmiths index at the top' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_1.id}/blades")
    visit "/blade_smiths/#{@blade_smith_2.id}"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_2.id}/blades")
    visit "/blade_smiths/#{@blade_smith_3.id}"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_3.id}/blades")
    visit "/blade_smiths/#{@blade_smith_4.id}"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_4.id}/blades")
  end

  it 'has a link to BladeSmiths update' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    expect(page).to have_link(nil, href: "/blade_smiths/#{@blade_smith_1.id}/edit")
  end

  it 'has a link that deletes the bladesmith' do
    visit "/blade_smiths/#{@blade_smith_1.id}"
    click_link("Delete Bladesmith")
    expect(current_path).to eq('/blade_smiths')
    expect(page).to have_no_content("#{@blade_smith_1.name}")
  end
end

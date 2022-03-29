require 'rails_helper'

RSpec.describe 'blade_smiths blades index page', type: :feature do
  before :each do
    @blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    @blade_1 = @blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    @blade_2 = @blade_smith_1.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    @blade_3 = @blade_smith_1.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    @blade_4 = @blade_smith_1.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
  end
  it 'displays the models of each blade and attributes' do
    visit "/blade_smiths/#{@blade_smith_1.id}/blades"
    expect(page).to have_content(@blade_1.model)
    expect(page).to have_content(@blade_1.length)
    expect(page).to have_content(@blade_1.blade_material)
    expect(page).to have_content(@blade_1.handle_material)
    expect(page).to have_content(@blade_1.available)
    expect(page).to have_content(@blade_1.id)
    expect(page).to have_content(@blade_1.created_at)
    expect(page).to have_content(@blade_1.updated_at)
  end

  it 'has a link to the Blades index at the top' do
    visit "/blade_smiths/#{@blade_smith_1.id}/blades"
    expect(page).to have_link(nil, href: '/blades')
  end

  it 'has a link to the BladeSmiths index at the top' do
    visit "/blade_smiths/#{@blade_smith_1.id}/blades"
    expect(page).to have_link(nil, href: '/blade_smiths')
  end

  it 'has a link to sort blades alphabetically' do
    visit "/blade_smiths/#{@blade_smith_1.id}/blades"
    click_link("Sort Alphabetically")
    expect(@blade_2.model).to appear_before(@blade_3.model)
    expect(@blade_3.model).to appear_before(@blade_1.model)
    expect(@blade_1.model).to appear_before(@blade_4.model)
  end

end

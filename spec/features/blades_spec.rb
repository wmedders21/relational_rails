require 'rails_helper'

RSpec.describe 'blades index page', type: :feature do
  it 'displays the model of each blade and attributes' do
    blade_1 = Blade.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    blade_2 = Blade.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    blade_3 = Blade.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    blade_4 = Blade.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)

    visit '/blades'
    save_and_open_page
    expect(page).to have_content(blade_1.model)
    expect(page).to have_content(blade_1.length)
    expect(page).to have_content(blade_1.blade_material)
    expect(page).to have_content(blade_1.handle_material)
    expect(page).to have_content(blade_1.available)
    expect(page).to have_content(blade_1.id)
    expect(page).to have_content(blade_1.created_at)
    expect(page).to have_content(blade_1.updated_at)

    expect(page).to have_content(blade_2.model)
    expect(page).to have_content(blade_2.length)
    expect(page).to have_content(blade_2.blade_material)
    expect(page).to have_content(blade_2.handle_material)
    expect(page).to have_content(blade_2.available)
    expect(page).to have_content(blade_2.id)
    expect(page).to have_content(blade_2.created_at)
    expect(page).to have_content(blade_2.updated_at)

    expect(page).to have_content(blade_3.model)
    expect(page).to have_content(blade_3.length)
    expect(page).to have_content(blade_3.blade_material)
    expect(page).to have_content(blade_3.handle_material)
    expect(page).to have_content(blade_3.available)
    expect(page).to have_content(blade_3.id)
    expect(page).to have_content(blade_3.created_at)
    expect(page).to have_content(blade_3.updated_at)

    expect(page).to have_content(blade_4.model)
    expect(page).to have_content(blade_4.length)
    expect(page).to have_content(blade_4.blade_material)
    expect(page).to have_content(blade_4.handle_material)
    expect(page).to have_content(blade_4.available)
    expect(page).to have_content(blade_4.id)
    expect(page).to have_content(blade_4.created_at)
    expect(page).to have_content(blade_4.updated_at)
  end
end

RSpec.describe 'blades show page', type: :feature do
  it 'displays the model of blade with corresponding id and attributes' do
    blade_1 = Blade.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    blade_2 = Blade.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    blade_3 = Blade.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    blade_4 = Blade.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)

    visit "/blades/#{blade_1.id}"
    save_and_open_page
    expect(page).to have_content(blade_1.model)
    expect(page).to have_content(blade_1.length)
    expect(page).to have_content(blade_1.blade_material)
    expect(page).to have_content(blade_1.handle_material)
    expect(page).to have_content(blade_1.available)
    expect(page).to have_content(blade_1.id)
    expect(page).to have_content(blade_1.created_at)
    expect(page).to have_content(blade_1.updated_at)
  end
end

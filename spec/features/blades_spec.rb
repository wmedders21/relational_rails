require 'rails_helper'

RSpec.describe 'blades index page', type: :feature do
  it 'displays the model of each blade and attributes' do
    blade_1 = Blade.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    blade_2 = Blade.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    blade_3 = Blade.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    blade_4 = Blade.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)

    visit '/blades'
    save_and_open_page
    # expect(page).to have_content(blade_smith_1.name)
    # expect(page).to have_content(blade_smith_2.name)
    # expect(page).to have_content(blade_smith_3.name)
    # expect(page).to have_content(blade_smith_4.name)
  end
end

require 'rails_helper'

RSpec.describe 'blade smiths update page', type: :feature do
  before :each do
    @blade_smith = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    @blade = @blade_smith.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
  end

  it 'can update an existing bladesmith' do
    visit "/blades/#{@blade.id}/edit"
    fill_in('Model', with: "Pole Axe")
    fill_in('Length', with: 1330)
    fill_in('Blade material', with: "Bronze")
    fill_in('Handle material', with: "Ash")
    fill_in('Available', with: "yes")

    click_button("Update Blade")

    expect(current_path).to eq("/blades/#{@blade.id}")
    expect(page).to have_content("Pole Axe")
    expect(page).to have_content("Bronze")
    expect(page).to have_content("Ash")
    expect(page).to have_content(1330)
    expect(page).to have_content(true)
    expect(page).to have_content(@blade_smith.id)
  end
end

require 'rails_helper'

RSpec.describe 'blade smiths update page', type: :feature do
  before :each do
    @blade_smith = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
  end
  it 'exists' do
    visit "/blade_smiths/#{@blade_smith.id}/edit"
    expect(current_path).to eq("/blade_smiths/#{@blade_smith.id}/edit")
  end

  it 'can update an existing bladesmith' do
    visit "/blade_smiths/#{@blade_smith.id}/edit"
    fill_in('Name', with: "Hershel House")
    fill_in('State', with: "KY, USA")
    fill_in('Avg yearly output', with: 345)
    fill_in('Hand forger', with: "yes")

    click_button("Update #{@blade_smith.name}")

    expect(current_path).to eq("/blade_smiths/#{@blade_smith.id}")
    expect(page).to have_content("Hershel House")
    expect(page).to have_content("KY, USA")
    expect(page).to have_content(345)
    expect(page).to have_content(true)
  end
end

require 'rails_helper'

RSpec.describe 'blade smiths update page', type: :feature do
  before :each do
    @blade_smith = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
  end
  xit 'exists' do
    visit "/blade_smiths/#{@blade_smith.id}/edit"
    expect(current_path).to eq("/blade_smiths/#{@blade_smith.id}/edit")
  end

  xit 'can update an existing bladesmith' do
    visit "/blade_smiths/#{@blade_smith.id}/edit"
    fill_in('Avg yearly output', with: 13009)
    click_button('Create Bladesmith')

    expect(current_path).to eq("/blade_smiths/#{@blade_smith.id}")
    expect(page).to have_content(13009)
  end
end

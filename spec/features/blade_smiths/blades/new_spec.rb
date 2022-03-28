require 'rails_helper'

RSpec.describe 'bladesmiths blades new page', type: :feature do
  before :each do
    @blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
  end

  it 'can create a new blade' do
    visit "/blade_smiths/#{@blade_smith_4.id}/blades/new"
    fill_in('Model', with: 'Hatchet')
    fill_in('Length', with: '540')
    fill_in('Blade material', with: "Tool Steel")
    fill_in('Handle material', with: "Hickory")
    fill_in('Available', with: true)

    click_button('Create Blade')
    
    expect(current_path).to eq("/blade_smiths/#{@blade_smith_4.id}/blades")
    expect(page).to have_content("Hatchet")
  end
end

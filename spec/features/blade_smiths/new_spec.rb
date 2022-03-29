require 'rails_helper'

RSpec.describe 'blade smiths new page', type: :feature do
  it 'exists' do
    visit '/blade_smiths/new'
    expect(current_path).to eq('/blade_smiths/new')
  end

  it 'can create a new bladesmith' do
    visit 'blade_smiths/new'
    fill_in('Name', with: 'Cold Steel')
    fill_in('State', with: 'TX')
    fill_in('Avg yearly output', with: 13009)
    fill_in('Hand forger', with: false)
    click_button('Create Bladesmith')

    new_blade_smith_id = BladeSmith.last.id
    expect(current_path).to eq("/blade_smiths/#{new_blade_smith_id}")
    expect(page).to have_content("Cold Steel")
  end
end

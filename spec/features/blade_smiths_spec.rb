require 'rails_helper'

RSpec.describe 'the blade smiths index', type: :feature do
  it 'displays the name of each blade smith' do
    blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
    blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
    blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
    visit '/blade_smiths'
    save_and_open_page
    expect(page).to have_content(blade_smith_1.name)
    expect(page).to have_content(blade_smith_2.name)
    expect(page).to have_content(blade_smith_3.name)
    expect(page).to have_content(blade_smith_4.name)
  end
end

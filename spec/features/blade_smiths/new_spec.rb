require 'rails_helper'

RSpec.describe 'blade smiths new page', type: :feature do
  it 'exists' do
    visit '/blade_smiths/new'
    expect(current_path).to eq('/blade_smiths/new')
  end

  # xit 'displays blade smiths in order most recently created' do
  #   blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
  #   blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
  #   blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
  #   blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
  #   visit '/blade_smiths'
  #   expect(blade_smith_4.name).to appear_before(blade_smith_3.name)
  #   expect(blade_smith_3.name).to appear_before(blade_smith_2.name)
  #   expect(blade_smith_2.name).to appear_before(blade_smith_1.name)
  # end
  #
  # xit 'has a link to the Blades index at the top' do
  #   blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
  #   visit "/blade_smiths"
  #   expect(page).to have_link(nil, href: '/blades')
  # end
  #
  # xit 'has a link to the BladeSmiths index at the top' do
  #   visit "/blade_smiths"
  #   expect(page).to have_link(nil, href: '/blade_smiths')
  # end
  #
  # xit 'has a link to BladeSmiths new' do
  #   visit "/blade_smiths"
  #   expect(page).to have_link(nil, href: '/blade_smiths/new')
  # end
end

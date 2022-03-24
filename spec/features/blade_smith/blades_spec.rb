require 'rails_helper'

RSpec.describe 'blade_smith blades index page', type: :feature do
  before :each do
    @blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    @blade_1 = @blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    @blade_2 = @blade_smith_1.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    @blade_3 = @blade_smith_1.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    @blade_4 = @blade_smith_1.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
  end
  it 'displays the model of each blade and attributes' do
    visit "/blade_smiths/#{@blade_smith_1.id}/blades"
    save_and_open_page
  end
end

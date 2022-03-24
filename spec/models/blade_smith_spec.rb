require 'rails_helper'

RSpec.describe BladeSmith, type: :model do
  it {should have_many :blades}
end
RSpec.describe BladeSmith, type: :model do
  describe '#sort_by_newest' do
    it 'returns array sorts by newest' do
      blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
      blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
      blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
      blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
      expect(BladeSmith.sort_by_newest).to eq([blade_smith_4, blade_smith_3, blade_smith_2, blade_smith_1])
    end
  describe '#model_count' do
    it 'returns the number of Blades associated with a BladeSmith' do
      blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
      blade_1 = blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
      blade_2 = blade_smith_1.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
      blade_3 = blade_smith_1.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
      blade_4 = blade_smith_1.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)

      expect(BladeSmith.model_count).to eq(4)
    end
  end
end

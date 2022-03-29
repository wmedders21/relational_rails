require 'rails_helper'

RSpec.describe Blade, type: :model do
  it {should belong_to :blade_smith}

  describe '#available?' do
    before :each do
      @blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
      @blade_1 = @blade_smith_1.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
      @blade_2 = @blade_smith_1.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
      @blade_3 = @blade_smith_1.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
      @blade_4 = @blade_smith_1.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
    end
    it 'returns blades where the attribute available == true' do
      expect(@blade_smith_1.blades.available?).to eq([@blade_1, @blade_2])
    end
  end
end

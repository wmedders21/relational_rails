require 'rails_helper'

RSpec.describe BladeSmith, type: :model do
  it {should have_many :blades}
end
RSpec.describe BladeSmith, type: :model do
  describe '#sort_by_newest' do
    it 'sorts by newest' do
      blade_smith_1 = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
      blade_smith_2 = BladeSmith.create!(name: "Bill Scagel", state: "MI", avg_yearly_output: 104, hand_forger: true)
      blade_smith_3 = BladeSmith.create!(name: "Randall Made Knives", state: "FL", avg_yearly_output: 2043, hand_forger: true)
      blade_smith_4 = BladeSmith.create!(name: "Ka-Bar Knives, Inc.", state: "NY", avg_yearly_output: 15465, hand_forger: false)
      expect(BladeSmith.sort_by_newest).to eq([blade_smith_4, blade_smith_3, blade_smith_2, blade_smith_1])

    end
  end
end

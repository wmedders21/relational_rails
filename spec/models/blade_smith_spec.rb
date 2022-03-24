require 'rails_helper'

RSpec.describe BladeSmith, type: :model do
  it {should have_many :blades}
end

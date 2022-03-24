require 'rails_helper'

RSpec.describe Blade, type: :model do

  it {should belong_to :songs}
end

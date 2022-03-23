require 'rails_helper'

RSpec.describe 'the blade smiths index', type: :feature do
  it 'displays the name of each blade smith' do
    visit '/blade_smiths'
  end
end

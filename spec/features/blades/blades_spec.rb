require 'rails_helper'

RSpec.describe 'blades' do
  before :each do
    @bs = BladeSmith.create!(name: "Willy White", state: "KY", avg_yearly_output: 324, hand_forger: true)
    @blade_1 = @bs.blades.create!(model: "Patch Knife", length: 135, blade_material: "Damascus", handle_material: "Walnut", available: true)
    @blade_2 = @bs.blades.create!(model: "Diving Knife", length: 190, blade_material: "Stainless", handle_material: "Micarta", available: true)
    @blade_3 = @bs.blades.create!(model: "Fighting Knife", length: 240, blade_material: "Tool Steel", handle_material: "Stacked Leather", available: false)
    @blade_4 = @bs.blades.create!(model: "Skinner", length: 170, blade_material: "High Carbon Steel", handle_material: "Figured Maple", available: false)
  end
  describe 'blades index page', type: :feature do
    it 'displays the model of each blade and attributes where available == true' do
      visit '/blades'
      expect(page).to have_content(@blade_1.model)
      expect(page).to have_content(@blade_1.length)
      expect(page).to have_content(@blade_1.blade_material)
      expect(page).to have_content(@blade_1.handle_material)
      expect(page).to have_content(@blade_1.available)
      expect(page).to have_content(@blade_1.id)
      expect(page).to have_content(@blade_1.created_at)
      expect(page).to have_content(@blade_1.updated_at)

      expect(page).to have_content(@blade_2.model)
      expect(page).to have_content(@blade_2.length)
      expect(page).to have_content(@blade_2.blade_material)
      expect(page).to have_content(@blade_2.handle_material)
      expect(page).to have_content(@blade_2.available)
      expect(page).to have_content(@blade_2.id)
      expect(page).to have_content(@blade_2.created_at)
      expect(page).to have_content(@blade_2.updated_at)

      expect(page).to have_no_content(@blade_3.model)
      expect(page).to have_no_content(@blade_3.id)

      expect(page).to have_no_content(@blade_4.model)
      expect(page).to have_no_content(@blade_4.id)
    end

    it 'has a link to the Blades index at the top' do
      visit "/blades"
      expect(page).to have_link(nil, href: '/blades')
    end

    it 'has a link to the BladeSmiths index at the top' do
      visit "/blades"
      expect(page).to have_link(nil, href: '/blade_smiths')
    end
  end


  describe 'blades show page', type: :feature do
    it 'displays the model of blade with corresponding id and attributes' do
      visit "/blades/#{@blade_1.id}"
      expect(page).to have_content(@blade_1.model)
      expect(page).to have_content(@blade_1.length)
      expect(page).to have_content(@blade_1.blade_material)
      expect(page).to have_content(@blade_1.handle_material)
      expect(page).to have_content(@blade_1.available)
      expect(page).to have_content(@blade_1.id)
      expect(page).to have_content(@blade_1.created_at)
      expect(page).to have_content(@blade_1.updated_at)
    end

    it 'has a link to the Blades index at the top' do
      visit "/blades/#{@blade_1.id}"
      expect(page).to have_link(nil, href: '/blades')
    end

    it 'has a link to the BladeSmiths index at the top' do
      visit "/blades/#{@blade_1.id}"
      expect(page).to have_link(nil, href: '/blade_smiths')
      visit "/blades/#{@blade_2.id}"
      expect(page).to have_link(nil, href: '/blade_smiths')
      visit "/blades/#{@blade_3.id}"
      expect(page).to have_link(nil, href: '/blade_smiths')
      visit "/blades/#{@blade_4.id}"
      expect(page).to have_link(nil, href: '/blade_smiths')
    end

    it 'has a link to update the blade' do
      visit "/blades/#{@blade_1.id}"
      expect(page).to have_link(nil, href: "/blades/#{@blade_1.id}/edit")
    end
  end
end

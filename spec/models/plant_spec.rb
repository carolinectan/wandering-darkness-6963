require 'rails_helper'

RSpec.describe Plant, type: :model do
  before :each do
    @plant1 = Plant.create!(name: 'Sunflower', description: "yellow and tall", days_to_harvest: 103)
    @plant2 = Plant.create!(name: 'Pumpkin', description: "orange", days_to_harvest: 75)
    @plant3 = Plant.create!(name: 'Corn', description: "sweet and yellow", days_to_harvest: 60)
    @plant4 = Plant.create!(name: 'Wheat', description: "brown grain", days_to_harvest: 90)
    @plant5 = Plant.create!(name: 'Tomato', description: "red roma", days_to_harvest: 175)
    @plant6 = Plant.create!(name: 'Cucumber', description: "green vine", days_to_harvest: 60)
  end

  describe 'relationships' do
    it { should have_many(:plant_plots) }
    it { should have_many(:plots).through(:plant_plots) }
  end

  describe 'class methods' do
    describe '.unique_plants' do
      it 'displays plants that take less than 100 days to harvest' do
        expect(Plant.under_100_days).to eq([@plant2, @plant3, @plant4, @plant6])
      end
    end
  end
end

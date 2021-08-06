require 'rails_helper'

RSpec.describe Garden do
  before :each do
    @garden1 = Garden.create!(name: 'Vegetable Garden', organic: true)
    @garden2 = Garden.create!(name: 'Vegetable Garden', organic: true)

    @plot1 = @garden1.plots.create!(number: 1, size: 'Large', direction: 'South')
    @plot2 = @garden1.plots.create!(number: 2, size: 'Small', direction: 'East')
    @plot3 = @garden1.plots.create!(number: 3, size: 'Medium', direction: 'West')

    @plot4 = @garden2.plots.create!(number: 3, size: 'Medium', direction: 'West') #@garden2!!

    @plant1 = Plant.create!(name: 'Sunflower', description: "yellow and tall")
    @plant2 = Plant.create!(name: 'Pumpkin', description: "orange")
    @plant3 = Plant.create!(name: 'Corn', description: "sweet and yellow")
    @plant4 = Plant.create!(name: 'Wheat', description: "brown grain")
    @plant5 = Plant.create!(name: 'Tomato', description: "red roma")
    @plant6 = Plant.create!(name: 'Cucumber', description: "green vine")

    @plantplot1 = PlantPlot.create!(plant: @plant1, plot: @plot1)
    @plantplot2 = PlantPlot.create!(plant: @plant2, plot: @plot1)
    @plantplot3 = PlantPlot.create!(plant: @plant3, plot: @plot2)
    @plantplot4 = PlantPlot.create!(plant: @plant4, plot: @plot2)
    @plantplot5 = PlantPlot.create!(plant: @plant4, plot: @plot3)
    @plantplot6 = PlantPlot.create!(plant: @plant5, plot: @plot3)
    @plantplot7 = PlantPlot.create!(plant: @plant5, plot: @plot3)

    @plantplot8 = PlantPlot.create!(plant: @plant6, plot: @plot4) #@garden2!!
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    describe '#unique_plants' do
      it 'displays the unique plants of a garden' do
        # expect(@garden1.unique_plants.first.name).to eq(@plant1.name)
        # expect(@garden1.unique_plants.second.name).to eq(@plant2.name)
        # expect(@garden1.unique_plants.third.name).to eq(@plant3.name)
      end
    end
  end
end

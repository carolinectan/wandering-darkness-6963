require 'rails_helper'

RSpec.describe 'plots index page' do
  before :each do
    @garden1 = Garden.create!(name: 'Vegetable Garden', organic: true)
    @garden2 = Garden.create!(name: 'Vegetable Garden', organic: true)

    @plot1 = @garden1.plots.create!(number: 1, size: 'Large', direction: 'South')
    @plot2 = @garden1.plots.create!(number: 2, size: 'Small', direction: 'East')
    @plot3 = @garden1.plots.create!(number: 3, size: 'Medium', direction: 'West')
    @plot4 = @garden2.plots.create!(number: 3, size: 'Medium', direction: 'West')

    @plant1 = Plant.create!(name: 'Sunflower', description: "yellow and tall", days_to_harvest: 200)
    @plant2 = Plant.create!(name: 'Pumpkin', description: "orange", days_to_harvest: 103)
    @plant3 = Plant.create!(name: 'Corn', description: "sweet and yellow", days_to_harvest: 60)
    @plant4 = Plant.create!(name: 'Wheat', description: "brown grain", days_to_harvest: 75)
    @plant5 = Plant.create!(name: 'Tomato', description: "red roma", days_to_harvest: 86)
    @plant6 = Plant.create!(name: 'Cucumber', description: "green vine", days_to_harvest: 50)

    @plantplot1 = PlantPlot.create!(plant: @plant1, plot: @plot1)
    @plantplot2 = PlantPlot.create!(plant: @plant2, plot: @plot1)

    @plantplot3 = PlantPlot.create!(plant: @plant3, plot: @plot2)

    @plantplot4 = PlantPlot.create!(plant: @plant4, plot: @plot3)
    @plantplot5 = PlantPlot.create!(plant: @plant5, plot: @plot3)

    @plantplot6 = PlantPlot.create!(plant: @plant6, plot: @plot4)

    visit "/plots"
  end

  it 'displays a list of all plot numbers' do
    expect(page).to have_content("All Plots")

    expect(page).to have_content(@plot1.number)
    expect(page).to have_content(@plot2.number)
    expect(page).to have_content(@plot3.number)
    expect(page).to have_content(@plot4.number)
  end

  it "displays under each plot number the names of all that plot's plants" do
    within "#plot-#{@plot1.id}" do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)

      expect(page).to have_no_content(@plant3.name)
      expect(page).to have_no_content(@plant4.name)
      expect(page).to have_no_content(@plant5.name)
      expect(page).to have_no_content(@plant6.name)
    end
  end

  it 'displays a link to remove each plant from that plot' do
    expect(page).to have_button("Remove #{@plant1.name}")
    expect(page).to have_button("Remove #{@plant2.name}")
    expect(page).to have_button("Remove #{@plant3.name}")
    expect(page).to have_button("Remove #{@plant4.name}")
    expect(page).to have_button("Remove #{@plant5.name}")
    expect(page).to have_button("Remove #{@plant6.name}")

    click_on("Remove #{@plant1.name}")

    expect(current_path).to eq("/plots")

    within "#plot-#{@plot1.id}" do
      expect(page).to have_no_content(@plant1.name)
    end
  end
end

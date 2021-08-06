# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plant.destroy_all
Plot.destroy_all
PlantPlot.destroy_all
Garden.destroy_all

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

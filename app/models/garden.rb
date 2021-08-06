class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, through: :plots
  has_many :plants, through: :plant_plots

  # def unique_plants
    # plots.joins(:plants)
    #      .select('plants.*', 'plants.id as plant_id')
    #      .group('plants.id')
    #      .distinct
  # end
end

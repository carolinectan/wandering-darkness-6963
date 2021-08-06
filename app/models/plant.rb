class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def self.under_100_days
    where('days_to_harvest < 100')
  end
end

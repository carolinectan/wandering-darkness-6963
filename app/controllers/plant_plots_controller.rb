class PlantPlotsController < ApplicationController
  def destroy
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])

    plantplot = PlantPlot.find_by(plant: plant.id, plot: plot.id)

    plantplot.destroy
    redirect_to '/plots'
  end

  # private
  # def _params
  #   params.permit(:)
  # end
end

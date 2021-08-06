class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
  end

  # private
  # def _params
  #   params.permit(:)
  # end
end

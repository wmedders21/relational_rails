class BladeSmithsController < ApplicationController

  def index
    @blade_smiths = BladeSmith.sort_by_newest
  end

  def show
    @blade_smith = BladeSmith.find(params[:id])
  end

  def new
  end

  def create
    blade_smith = BladeSmith.create(blade_smith_params)
    redirect_to "/blade_smiths/#{blade_smith.id}"
  end

  def update
  end

  def blade_smith_params
    params.permit(:name, :state, :avg_yearly_output, :hand_forger)
  end
end

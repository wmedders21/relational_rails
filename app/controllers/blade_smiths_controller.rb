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
    blade_smith = BladeSmith.create(name: params[:name], state: params[:state], avg_yearly_output: params[:avg_yearly_output], hand_forger: params[:hand_forger])
    redirect_to "/blade_smiths/#{blade_smith.id}"
  end
end

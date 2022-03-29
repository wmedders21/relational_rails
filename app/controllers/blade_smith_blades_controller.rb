class BladeSmithBladesController < ApplicationController
  def index
    @blade_smith = BladeSmith.find(params[:blade_smith_id])
    @blades = @blade_smith.blades
    @sorted = @blades.sorted_by_model
  end

  def new
    @blade_smith = BladeSmith.find(params[:blade_smith_id])
  end

  def create
    blade_smith = BladeSmith.find(params[:blade_smith_id])
    blade = blade_smith.blades.create(blade_params)
    redirect_to "/blade_smiths/#{blade_smith.id}/blades"
  end

  def blade_params
    params.permit(:model, :length, :blade_material, :handle_material, :available, :blade_smith_id)
  end
end

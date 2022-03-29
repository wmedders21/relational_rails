class BladesController < ApplicationController
  def index
    @blades = Blade.available?
  end

  def show
    @blade = Blade.find(params[:id])
  end

  def edit
    @blade = Blade.find(params[:id])
  end

  def update
    blade = Blade.find(params[:id])
    blade.update(blade_params)
    redirect_to "/blades/#{blade.id}"
  end

  def blade_params
    params.permit(:model, :length, :blade_material, :handle_material, :available, :blade_smith_id)
  end
end

class BladeSmithBladesController < ApplicationController
  def index
    @blade_smith = BladeSmith.find(params[:blade_smith_id])
    @blades = @blade_smith.blades
  end
end

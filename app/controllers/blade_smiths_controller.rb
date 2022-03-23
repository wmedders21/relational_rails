class BladeSmithsController < ApplicationController

  def index
    @blade_smiths = BladeSmith.all
  end

  def show
    @blade_smith = BladeSmith.find(params[:id])
  end
end

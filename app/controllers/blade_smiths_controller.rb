class BladeSmithsController < ApplicationController

  def index
    @blade_smiths = BladeSmith.sort_by_newest
  end

  def show
    @blade_smith = BladeSmith.find(params[:id])
  end

  def new

  end
end

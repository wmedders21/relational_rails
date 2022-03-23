class BladeSmithsController < ApplicationController

  def index
    @blade_smiths = BladeSmith.all
  end
end

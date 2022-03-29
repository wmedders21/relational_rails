class BladesController < ApplicationController
  def index
    @blades = Blade.all
  end

  def show
    @blade = Blade.find(params[:id])
  end
end

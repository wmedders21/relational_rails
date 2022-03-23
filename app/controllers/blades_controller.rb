class BladesController < ApplicationController
  def index
    @blades = Blade.all
  end
end

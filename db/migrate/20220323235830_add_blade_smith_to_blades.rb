class AddBladeSmithToBlades < ActiveRecord::Migration[5.2]
  def change
    add_reference :blades, :blade_smith, foreign_key: true
  end
end

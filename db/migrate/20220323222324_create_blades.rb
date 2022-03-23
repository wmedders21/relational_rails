class CreateBlades < ActiveRecord::Migration[5.2]
  def change
    create_table :blades do |t|
      t.string :model
      t.integer :length
      t.string :blade_material
      t.string :handle_material
      t.boolean :available

      t.timestamps
    end
  end
end

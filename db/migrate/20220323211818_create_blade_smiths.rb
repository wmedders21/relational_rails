class CreateBladeSmiths < ActiveRecord::Migration[5.2]
  def change
    create_table :blade_smiths do |t|
      t.string :name
      t.string :state
      t.integer :avg_yearly_output
      t.boolean :hand_forger
      t.timestamps
    end
  end
end

class Blade < ApplicationRecord
  belongs_to :blade_smith

  def self.available?
    self.where(available: true)
  end

  def self.sorted_by_model
    self.order(:model)
  end
end

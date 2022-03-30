class Blade < ApplicationRecord
  belongs_to :blade_smith

  def self.available?
    where(available: true)
  end

  def self.sorted_by_model
    order(:model)
  end

  def self.over_threshold(arg)
    where('length > ?', arg)
  end

end

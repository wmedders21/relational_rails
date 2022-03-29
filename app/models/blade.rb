class Blade < ApplicationRecord
  belongs_to :blade_smith

  def self.available?
    self.where(available: true)
  end
end

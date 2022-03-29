class BladeSmith < ApplicationRecord
  has_many :blades

  def self.sort_by_newest
    self.order("updated_at DESC")
  end

  def model_count
    blades.count
  end
end

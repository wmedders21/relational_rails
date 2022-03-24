class BladeSmith < ApplicationRecord
  has_many :blades

  def self.sort_by_newest
    self.all.sort.reverse
  end

  def model_count
    blades.count
  end
end

class BladeSmith < ApplicationRecord
  has_many :blades

  def self.sort_by_newest
    self.all.sort.reverse
  end
end

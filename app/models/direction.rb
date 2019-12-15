class Direction < ApplicationRecord
  belongs_to :recipe

  validates :step, presence: true
end

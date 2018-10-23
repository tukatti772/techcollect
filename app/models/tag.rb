class Tag < ApplicationRecord
  validates :name,:type, presence: true
end

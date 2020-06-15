class Board < ApplicationRecord
  has_many :topics, dependent: :destroy
  validates :name, length: { minimum: 1 }
end

class Board < ApplicationRecord
  has_many :topics, dependent: :destroy
  validates :name, length: { minimum: 1 }, uniqueness: true

  def to_param
    name
  end
end

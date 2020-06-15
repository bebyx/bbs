class Topic < ApplicationRecord
  belongs_to :board
  has_many :replies, dependent: :destroy
  validates :message, length: { minimum: 1 }
end

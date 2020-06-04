class Topic < ApplicationRecord
  has_many :replies, dependent: :destroy
  validates :message, length: { minimum: 1 }
end

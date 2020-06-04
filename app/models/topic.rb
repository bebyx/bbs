class Topic < ApplicationRecord
  has_many :replies, dependent: :destroy
  validates :message, presence: true,
                      length: { minimum: 1 }
end

class Topic < ApplicationRecord
  validates :message, presence: true,
                      length: { minimum: 1 }
end

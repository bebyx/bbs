class Reply < ApplicationRecord
  belongs_to :topic
  validates :user, length: { minimum: 1 }
  validates :body, length: { minimum: 1 }
end

class Reply < ApplicationRecord
  belongs_to :topic
  validates :body, length: { minimum: 1 }
end

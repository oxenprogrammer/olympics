class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :text, presence: true, length: { minimum: 12, maximum: 100 }
end

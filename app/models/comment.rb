class Comment < ApplicationRecord
  belongs_to :music
  belongs_to :user
  validates :content, length: { maximum: 140}

end

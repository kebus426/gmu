class Music < ApplicationRecord
  belongs_to :user
  mount_uploader :file, AudioFileUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :file, presence: true
  validates :caption, length: { maximum: 140}
  validates :music_name, presence: true

  has_many :favorites, class_name: "Favorite", foreign_key: :music_id
  has_many :faved_users, through: :favorites
end

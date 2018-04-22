class Music < ApplicationRecord
  belongs_to :user
  mount_uploader :file, AudioFileUploader
  mount_uploader :artwork, ArtworkUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :file, presence: true
  validates :caption, length: { maximum: 140}
  validates :music_name, presence: true, uniqueness: false
  
  has_many :favorites, class_name: "Favorite", foreign_key: :music_id, dependent: :destroy
  has_many :faved_users, through: :favorites

  has_many :comments, dependent: :delete_all
end

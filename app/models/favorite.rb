class Favorite < ApplicationRecord
  belongs_to :faved_user, class_name: "User", foreign_key: :user_id
  belongs_to :fav_music, class_name: "Music", foreign_key: :music_id
end

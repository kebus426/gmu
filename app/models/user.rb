# coding: utf-8
class User < ApplicationRecord
  has_many :musics, dependent: :destroy
  has_many :comments, dependent: :destroy
    attr_accessor :remember_token
  validates :user_name,
            presence: true,
            length: { maximum: 50},
            uniqueness: true
 
  has_many :favorites, class_name: "Favorite", foreign_key: :user_id
  has_many :fav_musics, through: :favorites

  #渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #def remember
  #  self.remember_token = User.new_token
  #  update_attribute(:remember_digest, User.digest(remember_token))
  #end

  #def authenticated?(remember_token)
  #  return false if remember_digest.nil?
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

  # ユーザーのログイン情報を破棄する
  #def forget
  #  update_attribute(:remember_digest, nil)
  #xend
end

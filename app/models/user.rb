# coding: utf-8
class User < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 50},
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  #渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
                                                  
end

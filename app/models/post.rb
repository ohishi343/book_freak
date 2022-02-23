class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_one_attached :image

  validates :author, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }
  validates :star, presence: true, numericality: true, length: { in: 1..5 }
  validates :user_id, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end
end

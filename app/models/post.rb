class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :author, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 140 }
  validates :star, presence: true, numericality: true, length: { in: 1..5 }
  validates :user_id, presence: true
end

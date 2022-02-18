class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites, dependent: :destroy

  has_one_attached :avatar

  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :profile, length: { maximum: 200 }

  def favorite_find(post_id)
    favorites.where(post_id: post_id).exists?
  end
end

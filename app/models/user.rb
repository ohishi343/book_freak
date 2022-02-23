class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_one_attached :avatar

  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :profile, length: { maximum: 200 }
end

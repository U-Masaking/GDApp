class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, foreign_key: :user_id

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :introduction, length: { maximum: 100 }
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :news, through: :bookmarks
  validates :introduction, length: {maximum: 500}

  #carrierwave用
  mount_uploader :image, ImageUploader
end

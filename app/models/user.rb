class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email
    validates :encrypted_password
    validates :nickname
    validates :familyname
    validates :firstname
    validates :profile
  end
  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :familyname
    validates :firstname
  end
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
end

class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  belongs_to :toilet
  belongs_to :fire
  belongs_to :river
  belongs_to :gomi
  belongs_to :water

  with_options presence: true do
    validates :image
    validates :text
    validates :place_id
    validates :toilet_id
    validates :fire_id
    validates :river_id
    validates :gomi_id
    validates :water_id
    validates :price, format: {with: /\A[0-9]+\z/ }
    validates :address
  end

  with_options numericality: { other_than: 1 } do
    validates :place_id
    validates :toilet_id
    validates :fire_id
    validates :river_id
    validates :gomi_id
    validates :water_id
  end

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%").
        or(where('campsite LIKE(?)', "%#{search}%"))
    else
      Post.all
    end
  end

  def self.prefecture(prefecture)
    Post.where(place_id: "#{prefecture}")
  end

  #def favorite(user)
    #favorites.create(user_id: user.id)
  #end

  #def unfavorite(user)
  #  favorites.find_by(user_id: user.id).destroy
  #end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def favorite_of(user)
    favorite = favorites.find_by(user_id: user.id)
  end

  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :reviews
  has_many :post_tags
end

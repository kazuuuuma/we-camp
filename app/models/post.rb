class Post < ApplicationRecord
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
  end

  with_options numericality: { other_than: 1 } do
    validates :place_id
    validates :toilet_id
    validates :fire_id
    validates :river_id
    validates :gomi_id
    validates :water_id
  end

  has_one_attached :image

  belongs_to :user
  has_many :favorites
  has_many :post_tags
end

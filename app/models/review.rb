class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :image
  validates :comment, presence: true
  validates :visit_day, presence: true
end

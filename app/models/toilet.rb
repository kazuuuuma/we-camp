class Toilet < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'トイレあり' },
    { id: 3, name: 'トイレなし' },
]

  include ActiveHash::Associations
  has_many :posts
end


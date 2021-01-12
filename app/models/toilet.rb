class Toilet < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '経済' },
    { id: 3, name: '政治' },
]

  include ActiveHash::Associations
  has_many :posts
end


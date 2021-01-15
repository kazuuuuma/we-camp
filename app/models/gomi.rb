class Gomi < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ゴミ捨て場あり' },
    { id: 3, name: 'ゴミ捨て場なし' },
]

  include ActiveHash::Associations
  has_many :posts
end


class Water < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '水道あり' },
    { id: 3, name: '水道なし' },
]

  include ActiveHash::Associations
  has_many :posts
end


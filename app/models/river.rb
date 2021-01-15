class River < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '川' },
    { id: 3, name: '海' },
    { id: 4, name: '山'}
]

  include ActiveHash::Associations
  has_many :posts
end


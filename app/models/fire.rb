class Fire < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '直火可' },
    { id: 3, name: '直火不可' },
    { id: 4, name: '共用かまどのみ火の使用可'}
]

  include ActiveHash::Associations
  has_many :posts
end

class Gender < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, { id: 1, name: '女の子' }, { id: 2, name: '男の子' },
  ]

  include ActiveHash::Associations
  has_many :pets
end
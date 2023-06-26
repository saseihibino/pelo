class Mood < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, { id: 1, name: '体調不良' }, { id: 2, name: '元気がない' },
    { id: 3, name: '普通' }, { id: 4, name: '元気がある' }, { id: 5, name: 'とても元気' },
  ]

  include ActiveHash::Associations
  has_many :logs
end
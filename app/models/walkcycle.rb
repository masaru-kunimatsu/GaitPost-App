class Walkcycle < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'IC' },
    { id: 3, name: 'LR' },
    { id: 4, name: 'MSt' },
    { id: 5, name: 'TSt' },
    { id: 6, name: 'PSw' },
    { id: 7, name: 'ISw' },
    { id: 8, name: 'MSw' },
    { id: 9, name: 'TSw' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
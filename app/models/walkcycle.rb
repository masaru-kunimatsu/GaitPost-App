class Walkcycle < ActiveHash::Base
   extend ActiveHash::Associations::ActiveRecordExtensions 
  self.data = [
    { id: 1, name: 'IC' },
    { id: 2, name: 'LR' },
    { id: 3, name: 'MSt' },
    { id: 4, name: 'TSt' },
    { id: 5, name: 'PSw' },
    { id: 6, name: 'ISw' },
    { id: 7, name: 'MSw' },
    { id: 8, name: 'TSw' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
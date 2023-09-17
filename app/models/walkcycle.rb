class Walkcycle < ActiveHash::Base
   extend ActiveHash::Associations::ActiveRecordExtensions 
  self.data = [
    { id: 1, name: 'IC ～ LR' },
    { id: 2, name: 'LR ～ MSt' },
    { id: 3, name: 'MSt ～ TSt' },
    { id: 4, name: 'TSt ～ PSw' },
    { id: 5, name: 'PSw ～ ISw' },
    { id: 6, name: 'ISw ～ MSw' },
    { id: 7, name: 'MSw ～ TSw' },
    { id: 8, name: 'TSw ～ IC' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
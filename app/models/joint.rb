class Joint < ActiveHash::Base
   extend ActiveHash::Associations::ActiveRecordExtensions 
  self.data = [
    { id: 1, name: '腰椎・骨盤' },
    { id: 2, name: '股関節' },
    { id: 3, name: '膝関節' },
    { id: 4, name: '足関節' },
    { id: 5, name: '足指' },
    { id: 6, name: 'その他の関節' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
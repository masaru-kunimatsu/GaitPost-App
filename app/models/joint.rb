class Joint < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '腰椎' },
    { id: 3, name: '骨盤' },
    { id: 4, name: '股関節' },
    { id: 5, name: '膝関節' },
    { id: 6, name: '足関節' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end
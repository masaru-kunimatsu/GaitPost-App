class Muscle < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '大殿筋' },
    { id: 3, name: '中殿筋' },
    { id: 4, name: '大腿四頭筋' },
    { id: 5, name: 'ハムストリングス' },
    { id: 6, name: '下腿三頭筋' },
    { id: 7, name: '前脛骨筋' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end
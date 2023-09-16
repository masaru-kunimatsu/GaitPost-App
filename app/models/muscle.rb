class Muscle < ActiveHash::Base
  self.data = [
    { id: 1, name: '大殿筋' },
    { id: 2, name: '中殿筋' },
    { id: 3, name: '大腿四頭筋' },
    { id: 4, name: 'ハムストリングス' },
    { id: 5, name: '下腿三頭筋' },
    { id: 6, name: '前脛骨筋' },
  ]

  include ActiveHash::Associations
  has_many :posts, through: :post_muscles
  has_many :post_muscle

  end
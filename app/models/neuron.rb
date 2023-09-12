class Neuron < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '大脳' },
    { id: 3, name: '小脳' },
    { id: 4, name: '脳幹' },
    { id: 5, name: '脊髄' },
    { id: 6, name: '外側大腿皮神経' },
    { id: 7, name: '大腿神経' },
    { id: 8, name: '脛骨神経' },
    { id: 9, name: '腓骨神経' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end
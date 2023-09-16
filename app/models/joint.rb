class Joint < ActiveHash::Base
  self.data = [
    { id: 1, name: '腰椎' },
    { id: 2, name: '骨盤' },
    { id: 3, name: '股関節' },
    { id: 4, name: '膝関節' },
    { id: 5, name: '足関節' },
  ]

  include ActiveHash::Associations
  has_many :posts, through: :post_joints
  has_many :post_joint
  end
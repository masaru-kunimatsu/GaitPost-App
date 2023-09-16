class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags, through: :post_tag_relations
  has_many :post_tag_relations
  has_many :post_walkcycles
  has_many :walkcycles, through: :post_walkcycles
  has_many :post_muscles
  has_many :muscles, through: :post_muscles
  has_many :post_joints
  has_many :joints, through: :post_joints
  has_many :post_neurons
  has_many :neurons, through: :post_neurons

  validates :title, presence: true, length: { minimum: 1, maximum: 20, message: "can't be blank" }
  validates :detail, presence: true, length: { minimum: 1, maximum: 1000, message: "can't be blank" }
  validates :literature, presence: true, length: { minimum: 1, maximum: 200, message: "can't be blank" }
  validates :walkcycle_id , presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8} 
  validates :muscle_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6, allow_blank: true} 
  validates :joint_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, allow_blank: true} 
  validates :neuron_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, allow_blank: true} 
end
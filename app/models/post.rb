class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags, through: :post_tag_relations
  has_many :post_tag_relations
  has_many :post_walkcycles
  has_many :walkcycles
  belongs_to :muscle
  belongs_to :joint
  belongs_to :neuron

  validates :title, presence: true, length: { minimum: 1, maximum: 20, message: "can't be blank" }
  validates :detail, presence: true, length: { minimum: 1, maximum: 1000, message: "can't be blank" }
  validates :literature, presence: true, length: { minimum: 1, maximum: 200, message: "can't be blank" }
  validates :walkcycle_id , presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, message: "can't be blank"} 
  validates :muscle_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6, message: "can't be blank"} 
  validates :joint_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, message: "can't be blank"} 
  validates :neuron_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, message: "can't be blank"} 
end
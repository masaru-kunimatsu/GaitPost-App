class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags, through: :post_tag_relations
  has_many :post_tag_relations
  belongs_to :cycle
  belongs_to :muscle
  belongs_to :joint
  belongs_to :neuron
end

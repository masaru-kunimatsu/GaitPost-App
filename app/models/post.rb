class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags, through: :post_tag_relations
  has_many :post_tag_relations
end

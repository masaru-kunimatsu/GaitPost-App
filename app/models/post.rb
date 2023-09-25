class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  belongs_to :walkcycle
  belongs_to :joint

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
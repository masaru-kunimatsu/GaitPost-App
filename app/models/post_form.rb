class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor :title, :detail, :literature, :walkcycle_id, :joint_id, :user_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :user_id
    validates :title, presence: true, length: { minimum: 1, maximum: 20, message: "can't be blank" }
    validates :detail, presence: true, length: { minimum: 1, maximum: 1000, message: "can't be blank" }
    validates :literature, presence: true, length: { minimum: 1, maximum: 1000, message: "can't be blank" }
    validates :walkcycle_id , presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8} 
    validates :joint_id , presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8} 

  end

  def save
    post = Post.create(title: title, detail: detail, literature: literature, walkcycle_id: walkcycle_id, joint_id: joint_id, user_id: user_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    end
  
  end

  def update(params, post)
    post.post_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    post.update(params)
    PostTagRelation.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
  end
end
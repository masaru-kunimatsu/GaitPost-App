class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor :title, :detail, :literature, :walkcycle_id, :joint_id, :user_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :user_id
    validates :title, length: { minimum: 1, maximum: 20}
    validates :detail, length: { minimum: 1, maximum: 1000}
    validates :literature, length: { minimum: 1, maximum: 1000}
  end
  
  with_options numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8 } do
    validates :walkcycle_id
    validates :joint_id
  end

  validate :validate_tags

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

  def validate_tags
    tags = tag_name.split(',')
    tags.each do |tag|
      errors.add(:tag_name, ":1つのタグは30文字以内で入力してください") if tag.length > 30
    end
      errors.add(:tag_name, ":タグは最大10個まで登録できます") if tags.size > 10
  end
end
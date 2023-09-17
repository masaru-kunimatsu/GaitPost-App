class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor :title, :detail, :literature, :walkcycle_id, :user_id, :id, :created_at, :updated_at

  with_options presence: true do
    validates :user_id
    validates :title, presence: true, length: { minimum: 1, maximum: 20, message: "can't be blank" }
    validates :detail, presence: true, length: { minimum: 1, maximum: 1000, message: "can't be blank" }
    validates :literature, presence: true, length: { minimum: 1, maximum: 200, message: "can't be blank" }
    validates :walkcycle_id , presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8} 
  end

  def save
    Post.create(title: title, detail: detail, literature: literature, walkcycle_id: walkcycle_id, user_id: user_id)
  end

  def update(params, post)
    post.update(params)
  end
end
class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show ,:update ,:destroy]

  def index
    @posts = Post.all 
  end

  def new
    @post_form = PostForm.new
  end

  def show
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags.first&.tag_name
  end

  def update
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private
  def post_form_params
    params.require(:post_form).permit(:title, :detail, :literature, :walkcycle_id, :tag_name).merge(user_id: current_user.id)
  end

end
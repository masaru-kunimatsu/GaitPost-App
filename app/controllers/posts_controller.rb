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
      # redirect_to post_path(@post_form.id)
    else
      render :new
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private
  def post_form_params
    params.require(:post_form).permit(:title, :detail, :literature, :walkcycle_id).merge(user_id: current_user.id)
  end

end
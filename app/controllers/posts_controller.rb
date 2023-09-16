class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show ,:update ,:destroy]

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def show
    
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail, :literature,  walkcycle_id: [], muscle_id: [], joint_id: [], neuron_id: []).merge(user_id: current_user.id)
  end

end
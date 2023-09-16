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
      # redirect_to action: :index
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
    #params.require(:post).permit(:title, :detail, :literature,  walkcycle_id: [], muscle_id: [], joint_id: [], neuron_id: []).merge(user_id: current_user.id)
    params.require(:post).permit(
      :title,
      :detail,
      :literature,
      :walkcycle_id,  # walkcycle_id を許可する
      :muscle_id,    # muscle_id を許可する
      :joint_id,     # joint_id を許可する
      :neuron_id     # neuron_id を許可する
    ).merge(user_id: current_user.id)
  end

end





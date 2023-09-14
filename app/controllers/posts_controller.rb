class PostsController < ApplicationController

  def index
    @posts = Post.all 
  end

  def new
    @posts = Post.new
  end

  def show
    
  end

  def create
    Post.create(post_params)
    redirect_to action: :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail, :literature, :cycle_id, :muscle_id, :joint_id, :neuron_id).merge(user_id: current_user.id)
  end

end





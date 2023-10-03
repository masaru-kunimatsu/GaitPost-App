class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = current_user.posts.order(created_at: :desc)
    @comment_posts = Post.includes(:comments)
      .where(comments: { user_id: current_user.id })
      .order('comments.created_at DESC')
      .distinct
  end
end
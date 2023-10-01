class UsersController < ApplicationController
  before_action :set_user, only: [:likes]

  def show
    user = User.find(params[:id])
    @posts = current_user.posts.order(created_at: :desc)
    @comment_posts = Post.includes(:comments)
    .where.not(comments: { id: nil })
    .order('comments.created_at DESC')
    .distinct
  end
end
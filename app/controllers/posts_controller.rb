class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show ,:update ,:destroy]
  before_action :authenticate_user!, only: [:new ,:create ,:edit ,:update ,:destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    if user_signed_in?
      likes = Like.where(user_id: current_user.id).pluck(:post_id)
      @like_posts = Post.includes(:likes)
        .where(likes: { user_id: current_user.id })
        .order('likes.created_at DESC')
      like_post_ids = @like_posts.pluck(:id)
      @comment_posts = Post.includes(:comments)
        .where.not(comments: { id: nil })
        .order('comments.created_at DESC')
        .distinct
      @comment_posts = @comment_posts.reject { |post| like_post_ids.include?(post.id) }
      comment_post_ids = @comment_posts.pluck(:id)
      @posts = @posts.reject { |post| like_post_ids.include?(post.id) }
      @posts = @posts.reject { |post| comment_post_ids.include?(post.id) }
    else
      @like_posts = []
      @comment_posts = []
    end
  end

  def liked_post
    if user_signed_in?
      likes = Like.where(user_id: current_user.id).pluck(:post_id)
      @posts = Post.includes(:likes)
        .where(likes: { user_id: current_user.id })
        .order('likes.created_at DESC')
    else
      @posts = []
    end
  end

  def commented_post
    if user_signed_in?
      @posts = Post.includes(:comments)
        .where.not(comments: { id: nil })
        .order('comments.created_at DESC')
        .distinct
    else
      @posts = []
    end
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
    tag_name = post_form_params[:tag_name]
    input_tags = tag_name.split(',')
    if @post_form.valid?
      post = Post.new(
        title: @post_form.title,
        detail: @post_form.detail,
        literature: @post_form.literature,
        walkcycle_id: @post_form.walkcycle_id,
        joint_id: @post_form.joint_id,
        user_id: @post_form.user_id
      )
      input_tags.each do |tag|
        new_tag = Tag.find_or_create_by(tag_name: tag.strip)
        PostTagRelation.create(post: post, tag: new_tag)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags.map(&:tag_name).join(',')
  end

  def update
    @post_form = PostForm.new(post_form_params)
    tag_name = post_form_params[:tag_name]
    input_tags = tag_name.split(',')
    if @post_form.valid?
      @post.update(
        title: @post_form.title,
        detail: @post_form.detail,
        literature: @post_form.literature,
        walkcycle_id: @post_form.walkcycle_id,
        joint_id: @post_form.joint_id
      )
      @post.post_tag_relations.destroy_all
      new_tags = []
      input_tags.each do |tag|
        new_tag = Tag.find_or_create_by(tag_name: tag.strip)
        new_tags << new_tag
      end
      @post.tags = new_tags
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user.id
      @post.post_tag_relations.destroy_all
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def search_post
    @q = params.permit(:title, :detail, :tag_name, walkcycle_id_in: [], joint_id_in: []).to_h
    input_tags = @q[:tag_name].to_s.split(',')
  
    if @q[:title].present?
      squished_keywords = @q[:title].squish
      @q[:title_cont_any] = squished_keywords.split(" ")
    end
  
    custom_search_conditions = {
      title_cont_any: @q[:title],
      detail_cont_any: @q[:detail],
      walkcycle_id_in: @q[:walkcycle_id_in],
      joint_id_in: @q[:joint_id_in]
    }
    @posts = Post.ransack(custom_search_conditions).result.order(created_at: :desc)
    if input_tags.present?
      tags_conditions = input_tags.map { |tag| "tag_name LIKE ?" }.join(" OR ")
      tags_values = input_tags.map { |tag| "%#{tag}%" }
      @posts = @posts.joins(:tags).where(tags_conditions, *tags_values)
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private
  def post_form_params
    params.require(:post_form).permit(:title, :detail, :literature, :walkcycle_id, :joint_id, :tag_name).merge(user_id: current_user.id)
  end

end
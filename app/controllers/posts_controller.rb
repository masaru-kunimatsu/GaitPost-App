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
      @post.post_tag_relations.destroy_all
      input_tags.each do |tag|
        new_tag = Tag.find_or_create_by(tag_name: tag.strip)
        PostTagRelation.create(post: @post, tag: new_tag)
      end
      redirect_to root_path
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
  
    puts "Search Conditions: #{custom_search_conditions.inspect}"
  
    @posts = Post.ransack(custom_search_conditions).result
    # @tags = Tag.ransack(tag_name_cont_any: @q[:tag_name]).result
    @tags = Tag.where("tag_name LIKE ?", "%#{@q[:tag_name]}%") if @q[:tag_name].present?
  end

  def set_post
    @post = Post.find(params[:id])
  end



  private
  def post_form_params
    params.require(:post_form).permit(:title, :detail, :literature, :walkcycle_id, :joint_id, :tag_name).merge(user_id: current_user.id)
  end

end
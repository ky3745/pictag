class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).page(params[:page]).per(10)
    @tags = ActsAsTaggableOn::Tag.most_used
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").page(params[:page]).per(10)
    end
    @like = Like.new
  end
  def new
    @post = Post.new
  end
  def create
    
    Post.create(post_params)
    redirect_to root_path
  end
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
    @likes_count = Like.where(post_id: @post.id).count
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:image, :content, :tag_list).merge(user_id: current_user.id)
  end
end

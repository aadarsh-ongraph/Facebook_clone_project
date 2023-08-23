class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post created!'
    else
      @posts = Post.all
      render :index
    end
  end

  def show 

  end
  private

  def post_params
    params.require(:post).permit(:content)
  end
end
  

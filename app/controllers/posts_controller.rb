class PostsController < ApplicationController
  before_action :find_post, except: [:new, :create, :index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @tags = @post.tags
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      @tags = @post.tags
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

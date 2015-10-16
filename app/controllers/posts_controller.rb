class PostsController < ApplicationController
  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    params[:post][:tag_ids].each do |tag_id|
      unless tag_id.empty?
        @post.tags.push(Tag.find(tag_id))
      end
    end

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @tags = @post.tags
  end

  def update
    @post = Post.find(params[:id])
    @post.tags = []
    params[:post][:tag_ids].each do |tag_id|
      unless tag_id.empty?
        @post.tags.push(Tag.find(tag_id))
      end
    end
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      @tags = @post.tags
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tag_ids)
  end

  def collect_tags

  end
end

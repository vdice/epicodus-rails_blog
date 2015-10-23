class CommentsController < ApplicationController
  before_action :load_commentable, except: [:edit, :update, :destroy]
  before_action :find_comment, except: [:new, :create, :index]

  def create
     @comment = @commentable.comments.new(comment_params)
     if @comment.save
        redirect_to @commentable_path
     else
       redirect_to @commentable_path,
       alert: 'You must supply comment content'
     end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content, :commentable_id, :commentable_type)
  end

  def load_commentable
    @commentable = comment_params[:commentable_type].singularize.classify.constantize.find(comment_params[:commentable_id])
    @commentable_path = "/#{comment_params[:commentable_type]}/#{@commentable.id}"
  end

  def find_comment
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
    @commentable_controller = @comment.commentable_type.downcase.pluralize
    @commentable_path = "/#{@commentable_controller}/#{@commentable.id}"
  end
end

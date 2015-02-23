class CommentsController < ApplicationController

  before_action :authenticate_user!
    # http_basic_authenticate_with name: "abc", password: "secret", only: :destroy
  # can? :update, Comment
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(comment_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(@user)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

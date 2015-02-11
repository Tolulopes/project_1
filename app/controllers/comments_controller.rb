class CommentsController < ApplicationController

  before_action :authenticate_user!
    # http_basic_authenticate_with name: "abc", password: "secret", only: :destroy
  # can? :update, Comment
  

  def create
    @producer = Producer.find(params[:producer_id])
    @comment = @producer.comments.create(comment_params)
    redirect_to producer_path(@producer)
  end

  def destroy
    @producer = Producer.find(params[:article_id])
    @comment = @producer.comments.find(params[:id])
    @comment.destroy
    redirect_to producer_path(@producer)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

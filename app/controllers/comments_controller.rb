class CommentsController < ApplicationController

  before_action :authenticate_user!
    # http_basic_authenticate_with name: "abc", password: "secret", only: :destroy
  # can? :update, Comment
  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
    @comment = Comment.new
  end  

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  
  def create
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.track, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.new(track_params)

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def comment_params
      params.require(:comment).permit(:commenter, :body, :track_id, :user_id)
    end
end

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.all
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @comment }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @comment.delete
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:content, :product_id, :parent_id, :user_id)
  end
end

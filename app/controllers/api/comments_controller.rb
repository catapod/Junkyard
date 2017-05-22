class Api::CommentsController < Api::ApiController
  before_action :set_comment, only: [:show, :update, :destroy]
  
  def index
    @comments = Comment.all
    json_response(@comments)
  end

  def create
    @comment = Comment.create!(comment_params)
    json_response(@comment, :created)
  end

  def show
    json_response(@comment)
  end

  def update
    @comment.update(comment_params)
    json_response(@comment)
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.permit(
        :commentator_id,
        :body
      )      
    end
end

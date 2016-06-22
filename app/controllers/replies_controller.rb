class RepliesController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    comment = Comment.find(params[:reply][:comment_id])
    @reply = Reply.new(reply_params)
    if @reply.save
      @reply.update_attributes(author: "#{current_user.email}")
      comment.replies << @reply
    end
    redirect_to :back
  end

    def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to :back
  end

  private 

  def reply_params
    params.require(:reply).permit(:content, :comment_id)
  end

end

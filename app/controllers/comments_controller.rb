class CommentsController < ApplicationController

  def create
    bean = Bean.find(params[:bean_id])
    comment = current_user.comments.new(comment_params)
    comment.bean_id = bean.id
    comment.save
    redirect_to bean_path(bean)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to bean_path(params[:bean_id])
  end

private

def comment_params
  params.require(:comment).permit(:comment)
end

end

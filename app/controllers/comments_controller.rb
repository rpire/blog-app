class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_parameters.merge(author_id: current_user.id))
    @post.update_comments_counter
    redirect_back(fallback_location: root_path)
  end

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end

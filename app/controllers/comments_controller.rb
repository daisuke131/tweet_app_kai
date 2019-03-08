class CommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(body: comment_params[:body], user_id: current_user.id, post_id: @post.id)
        @comment.save
        redirect_to post_path(@post)     
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end

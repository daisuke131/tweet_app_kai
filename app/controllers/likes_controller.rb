class LikesController < ApplicationController

    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @post.likes.create(user_id: current_user.id)
        redirect_to(post_path(@post))
    end

    def destroy
        @like = Like.find_by(user_id: params[:id], post_id: params[:post_id])
        @like.destroy
        redirect_to(post_path(params[:post_id]))
    end
    
  end
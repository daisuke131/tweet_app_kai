# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vialiables

  def like
    current_user.likes.create(post_id: @post.id)
    @post.reload
  end

  def unlike
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    @post.reload
  end

    private
def set_vialiables
  @post = Post.find(params[:id])
  @id_name = "#like-link-#{@post.id}"
end
  end

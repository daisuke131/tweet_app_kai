# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.likes.create(post_id: params[:post_id])
    if path[:action] == 'index'
      redirect_to posts_path
    else
      # redirect_to "/posts/#{params[:post_id]}"
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @like.destroy
    if path[:action] == 'index'
      redirect_to posts_path
    else
      # redirect_to "/posts/#{params[:post_id]}"
      redirect_to post_path(params[:post_id])

    end
  end

    private

  def path
    Rails.application.routes.recognize_path(request.referer)
  end
  end

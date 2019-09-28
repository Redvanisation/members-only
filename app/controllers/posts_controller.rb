# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :user_logged_in, only: %i[new create]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id

    if @post.valid?
      @post.save
      flash[:success] = 'Article published successfully'
      redirect_to posts_url
    else
      flash.now[:danger] = "Title/content fields shouldn't be blank"
      render 'new'
    end
  end

  private

  def user_logged_in
    unless logged_in?
      flash[:danger] = 'You are not logged in / please login to be able to see the articles'
      redirect_to login_url
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

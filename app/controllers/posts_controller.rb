class PostsController < ApplicationController
before_action :user_logged_in, only: [:new, :create] 

def index
    @posts = Post.all
end

def new 
    @post = Post.new
end 


def create
    user_id = session[:user_id]
    @post = Post.new(post_params)

    @post.update_attribute(:user_id, user_id)

    if @post.save
        redirect_to posts_url
    else
        render 'new'
    end
end 



private
def user_logged_in
    unless  logged_in?
        flash[:danger] = "You are not logged in"
        redirect_to root_url
    end
end 

def post_params
    params.require(:post).permit(:title, :content)
end
end

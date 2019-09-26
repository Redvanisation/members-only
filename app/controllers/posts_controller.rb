class PostsController < ApplicationController
before_action :user_logged_in, only: [:new, :create] 

def new 
@post = Post.new
end 


def create
end 



private
def user_logged_in
    unless  logged_in?
        flash[:danger] = "You are not logged in"
        redirect_to root_url
    end
    
end 
end

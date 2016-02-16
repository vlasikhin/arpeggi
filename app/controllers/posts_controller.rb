class PostsController < ApplicationController
  before_action :owned_post, only: [:edit, :update, :destroy]  

  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new  
    @post = current_user.posts.build
  end


  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "Your post has been created!"
        redirect_to @post
        else
        flash[:alert] = "Your new post couldn't be created!  Please check the form."
        render :new
      end 
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
      flash[:success] = "Post updated!"
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Add more information!"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Problem solved!  Post deleted."
    end
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:caption, :article, :image)
  end

  def owned_post
    @post = Post.find(params[:id])
    unless current_user == @post.user
      flash[:alert] = "That post dosent't belong to you!"
      redirect_to root_path
    end
  end
end

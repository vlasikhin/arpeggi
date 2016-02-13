class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new  
    @post = Post.new
  end


  def create
    @post = Post.create(post_params)
      if @post.save
        flash[:success] = "Your post has been created!"
        redirect_to @post
        else
        flash[:alert] = "Add more information!"
        render :new
      end 
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
      flash[:success] = "Post updated hombre"
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Add more information!"
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:caption, :article, :image)
  end
end

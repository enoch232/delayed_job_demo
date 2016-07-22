class PostsController < ApplicationController
  before_action :post_find, only: [:destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = "Processing..." 
    @post.text = "Processing..."
    @title = params[:post][:title]
    @text = params[:post][:text]
    if @post.save
      Post.delay.deliver(@post.id, @title, @text)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  def post_find
    @post = Post.find(params[:id])
  end
end

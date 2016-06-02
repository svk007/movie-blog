class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(action: 'index')
    else
      render('new')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_from current_user
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:name, :year, :review, :image)
  end

end

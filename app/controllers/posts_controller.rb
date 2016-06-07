class PostsController < ApplicationController
  before_action :check_admin, only: [:edit]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      unless current_user.admin?
        flash[:notice] = "Post will show up after admin approval"
      end
      redirect_to posts_path
    else
      render('new')
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render('edit')
    end
  end

  def upvote
    @post = Post.friendly.find(params[:id])
    @post.upvote_from current_user
    redirect_to post_path(@post)
  end

  def tobe_posted
    @posts = Post.where(review: [nil, ""])
  end

  private

  def check_admin
    if current_user.admin? == false
      render :status => :forbidden, :text => "Forbidden"
    end
  end

  def post_params
    params.require(:post).permit(:name, :year, :review, :image)
  end

end

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :check_admin, only: [:edit, :destroy]
  def index
    @posts = Post.order(id: :ASC).paginate(page: params[:page], per_page: 6)
    @posts = @posts.movie_name(params[:movie_name]) if params[:movie_name].present?
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
    @posts = Post.where(review: [nil, ""]).paginate(page: params[:page], per_page: 50)
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    flash[:notice] = "Post #{@post.name} has been deleted"
    redirect_to posts_path
  end

  private

  def check_admin
    if current_user.admin? == false
      render status: :forbidden, text: "Forbidden"
    end
  end

  def post_params
    params.require(:post).permit(:name, :year, :review, :image)
  end

end

class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to :posts
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params{:id})
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(posts_params)
     redirect_to :posts
    else
     render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:description, :location, :time, :img, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end












end

class PostsController < ApplicationController
  before_action :set_user, except: [:show]

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
     redirect_to user_posts_path(current_user)
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
    params.require(:post).permit(:description, :title, :location, :help_time, :img, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end












end

class RepliesController < ApplicationController

  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    @reply.user = @user

    if @reply.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def edit
    @replies = Reply.find(params{:id})
  end

  def update
    @reply = Reply.find(params[:id])

    if @reply.update_attributes(reply_params)
     redirect_to :replies
    else
     render :edit
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to replies_path
  end
  private
  def reply_params
    params.require(:reply).permit(:content, :img, :user_id, :post_id)
  end



end

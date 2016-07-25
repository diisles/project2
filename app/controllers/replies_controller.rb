class RepliesController < ApplicationController

  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
  @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      redirect_to :replies
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
    params.require(:user).permit(:content, :img, :user_id, :post_id)
  end



end

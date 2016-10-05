class PostsController < ApplicationController
  before_action  :find_post, only: [:show, :edit, :update, :destroy]
  #Index action
  def index
    @posts = Post.all.limit(3).order('created_at DESC')
  end

  #New action
  def new
    @post = current_user.posts.build
  end

  #Create action
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Successfully saved the post!"
    else
      render :new, alert: "Oops! Something went wrong"
    end
  end

  #Edit action
  def edit
  end

  #Show action
  def show
  end

  #Update acton
  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: 'Successfully updated the Post!'
    else
      redirect_to :edit, alert: "Oops! Something went wrong!"
    end
  end

  #Destroy action
  def destroy
    @post.destroy
    redirect_to root_path, notice: "Successfully deleted the Post!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
  def find_post
    @post = Post.find(params[:id])
  end
end

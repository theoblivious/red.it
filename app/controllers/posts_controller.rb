class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    # respond_with(@posts)
  end

  def show
    @post= Post.find(params[:id])
    @comments = @post.comments #limit comments here and put it in by descending order

  end

  def new
    @post = Post.new

  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      current_user.posts << @post
      redirect_to posts_path
    else
      flash[:notice] = "Post did not save correctly "
      render :new
    end
  end

  def update
    @post.update(post_params)

  end

  def destroy
    @post.destroy
    # respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:link, :title, :user_id)
    end
end

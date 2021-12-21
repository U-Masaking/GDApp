class PostsController < ApplicationController
  before_action :authenticate_user!
  $youbi = %w(日 月 火 水 木 金 土)

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @user = current_user
    if @post.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to action: 'index'
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :start_on, :end_on)
    end
    
end

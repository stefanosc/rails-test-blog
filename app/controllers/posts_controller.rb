class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @posts = Post.all
  end

  def create
    @user =@post.find(params[:user_email])
    @post = @user.post.create(post_params)
    # @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
    
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
   
  private
    def post_params
      params.require(:post).permit(:user_id, :title, :text)
    end


end

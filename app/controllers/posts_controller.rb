class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def create
    @post = Post.new post_params
    if @post.save
     redirect_to root_path, notice: "Post Created!"
   else
     render :new
   end
end

  def delete
    @post = Post.find_by id: params[:id]
    @post.destroy
     redirect_to root_path, notice: "Post Destroyed!"
   end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

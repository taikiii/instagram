class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました！"
    else
      render 'new'
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました！"
  end

  end
  private
   def blogs_params
     params.require(:blog).permit(:content)
   end

   def set_blog
     @blog = Blog.find(params[:id])
   end
end

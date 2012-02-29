class BlogsController < ApplicationController
  
  def index
  	@blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.create params[:blog]
  	redirect_to blogs_path , notice: "Blog was created successfully"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find params[:id]

    if blog.update_attributes params[:blog]
        redirect_to blogs_path, notice: "Blog was updated successfully."
    end
  end

  def destroy
    Blog.destroy params[:id]
    redirect_to blogs_path, notice: "Blog has been deleted"
  end
end

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    #binding.pry
    if @post.valid?
      #binding.pry
      @post.save
      redirect_to post_path(@post)
    elsif @post.invalid?
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end

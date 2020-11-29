class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post = Post.new(post_params)
#    binding.pry

    if @post.valid?
      #binding.pry
      @post = Post.find_by_id(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
    # @post.update(post_params)

    # redirect_to post_path(@post)
  end
  
  # def update
  #   @post.update(post_params)

  #   redirect_to post_path(@post)
  # end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end

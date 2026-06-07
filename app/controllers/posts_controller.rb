class PostsController < ApplicationController
  # 1. GET /posts
  # Display all posts from the database
  def index
    @posts = Post.all
    render json: @posts
  end

  # 2. GET /posts/:id
  # Display a specific post by its ID
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  # 3. POST /posts
  # Create a new post
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # 4. PUT/PATCH /posts/:id
  # Update an existing post
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # 5. DELETE /posts/:id
  # Delete a specific post from the database
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  # Strong parameters to permit safe attributes
  def post_params
    params.require(:post).permit(:title, :body, :user_id) # عدلي الحقول حسب الموديل عندكِ لو مختلفة
  end
end
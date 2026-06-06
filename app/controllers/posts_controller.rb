class PostsController < ApplicationController
  # 1. GET /posts
  # عرض كل البوستات بداخل قاعدة البيانات
  def index
    @posts = Post.all
  end

  # 2. GET /posts/:id
  # عرض بوست واحد محدد بناءً على الـ ID بتاعه
  def show
    @post = Post.find(params[:id])
  end

  # 3. GET /posts/new
  # عرض شاشة الفورم لإنشاء بوست جديد
  def new
    @post = Post.new
  end

  # 4. POST /posts
  # استقبال بيانات الفورم وحفظها فعلياً في قاعدة البيانات
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 5. GET /posts/:id/edit
  # عرض شاشة تعديل بوست موجود مسبقاً
  def edit
    @post = Post.find(params[:id])
  end

  # 6. PATCH/PUT /posts/:id
  # استقبال البيانات المعدلة وتحديثها في قاعدة البيانات
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 7. DELETE /posts/:id
  # حذف البوست تماماً من قاعدة البيانات
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  # حماية الـ Parameters (Strong Parameters) لمنع الاختراق
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
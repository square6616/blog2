# class PostsController < ApplicationController
#   # before_action :set_post, only: [:show, :edit, :update, :destroy]
#   before_filter :authorize_blogger!, :except => [:index, :show]
#   # GET /posts
#   # GET /posts.json
#   def index
#     # @posts = Post.paginate(:page => params[:page], :per_page => 5).order('created_at DESC') #Post.all
#     @posts = Post
#           .paginate(:page => params[:page], :per_page => 5)
#           .order('created_at DESC')
#           
#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @posts }
#     end
#   end
# 
#   # GET /posts/1
#   # GET /posts/1.json
#   def show
#   end
# 
#   # GET /posts/new
#   def new
#     @post = Post.new
#   end
# 
#   # GET /posts/1/edit
#   def edit
#   end
# 
#   # POST /posts
#   # POST /posts.json
#   def create
#     @post = Post.new(post_params)
# 
#     respond_to do |format|
#       if @post.save
#         format.html { redirect_to @post, notice: 'Post was successfully created.' }
#         format.json { render action: 'show', status: :created, location: @post }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# 
#   # PATCH/PUT /posts/1
#   # PATCH/PUT /posts/1.json
#   def update
#     respond_to do |format|
#       if @post.update(post_params)
#         format.html { redirect_to @post, notice: 'Post was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: 'edit' }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# 
#   # DELETE /posts/1
#   # DELETE /posts/1.json
#   def destroy
#     @post.destroy
#     respond_to do |format|
#       format.html { redirect_to posts_url }
#       format.json { head :no_content }
#     end
#   end
# 
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_post
#       @post = Post.find(params[:id])
#     end
# 
#     # Never trust parameters from the scary internet, only allow the white list through.
#     def post_params
#       params.require(:post).permit(:title, :body)
#     end
# end
class PostsController < ApplicationController
  before_filter :authorize_blogger!, :except => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post
      .paginate(:page => params[:page], :per_page => 5)
      .order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
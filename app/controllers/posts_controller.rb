class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_pet, only: [:new, :create]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    if (params["k"] == Post::LOST)
      @title = "Extraviadas"
      @type = Post::LOST
      @posts = Post.lost
    elsif (params["k"] == Post::FOUND)
      @title = "Encontradas"
      @type = Post::FOUND
      @posts = Post.found
    elsif (params["k"] == Post::ADOPTION)
      @title = "en Adopción"
      @type = Post::ADOPTION
      @posts = Post.adoption
    elsif (params["k"] == Post::MATE)
      @title = "buscando Pareja"
      @type = Post::MATE
      @posts = Post.mate
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/select
  def select
    @user = current_user
    @pets = @user.pets
  end

  # GET /posts/new
  def new
    if @pet
      @post = @pet.posts.new
    else
      @post = Post.new
    end

    @user = current_user
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if @pet
      @post = @pet.posts.new post_params
    else
      @post = Post.new post_params
    end
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Tu anuncio se ha creado con éxito.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Tu anuncio se ha editado con éxito.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_pet
      @pet = Pet.find(params[:pet_id]) unless params[:pet_id].blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :kind, :photo, :name, :address)
    end
end

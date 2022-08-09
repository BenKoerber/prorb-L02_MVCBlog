class PostsController < ApplicationController

  before_action :get_post,        only: [:show, :edit, :create, :update, :destroy]
  before_action :logged_in_user,  only: [:create]
  before_action :correct_user,    only: [:edit, :update, :destroy]

  def show
    if @post.nil?
      flash[:notice] = "Post with id=#{params[:id]} does not exist."
      redirect_to dashboard_path
    end
  end

  def edit
    if @post.nil?
      flash[:notice] = "Post with id=#{params[:id]} does not exist."
      redirect_to dashboard_path
    end
  end

  def create
    @post = Post.new(post_params)
    user = User.find(session[:user_id])
    @post.user = user
    if !@post.save
      flash[:alert] = "Could not save post, sorry!"
    else
      flash[:notice] = "Successfully saved post."
    end
    redirect_to dashboard_path
  end

  def update
    if @post.update(post_params)                     
      flash[:success] = "Post has been sucessfully saved."
      redirect_to @post
    else
      flash[:altert] = "Sorry, could not save post!"
      render 'edit'                                     
    end
  end

  def destroy
    if !@post.nil?
      @post.destroy
      flash[:success] = "Post deleted."
    else
      flash[:warn] = "Post could not be deleted."
    end

    if request.referrer.nil? || request.referrer == posts_url
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end  
  
  private
    
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def get_post
      @post = Post.find_by(id: params[:id])
    end

    def correct_user
      redirect_to root_url unless @post.user == current_user
    end

end

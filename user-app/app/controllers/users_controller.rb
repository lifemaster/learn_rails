class UsersController < ApplicationController

  before_filter :find_user,       only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :check_if_admin,  only: [:new, :edit, :update, :create, :destroy]

  def index
    @users = User.all
  end

  def expensive
    @users = User.where("votes_count > 100")
    render 'index'
  end

  def show
    unless @user
      render file: '/public/404.html', status: 404
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
#   @user = User.find(params[:id])
  end

  def update
#   @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
#   @user = User.find(params[:id])
    @user.destroy
    redirect_to action: :index
  end

  def upvote
    @user.increment!(:votes_count)
    redirect_to action: :index
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :description, :login, :password)
    end

    def find_user
      @user = User.where(id: params[:id]).first
      render_404 unless @user
    end

end

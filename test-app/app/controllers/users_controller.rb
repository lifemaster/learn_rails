class UsersController < ApplicationController

  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
    # render text: @users.map(&:full_name).join('<br>')
  end

  def show
    unless @user
      render text: "Пользователь с id = #{params[:id]} не существует!", status: 404
    end
    # binding.pry
    # @user.birthday = @user.birthday.strftime('%d.%m.%Y')
  end

  def new
    @user = User.new
    # @user = User.create(user_params)
    # render text: "#{params}"
    # unless @user.new_record?
    #   render text: "#{@user.id}: #{@user.first_name} #{@user.last_name}"
    # else
    #   render text: "Произошла ошибка записи в БД"
    # end
  end

  def edit

  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to action: 'index'
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :login, :password, :description)
    end

    def find_user
      @user = User.find(params[:id])
    end

end

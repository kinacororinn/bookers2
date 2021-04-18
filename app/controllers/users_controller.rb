class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to books_path(@user.id),notice: 'You have updated user successfully'
    else
    render:edit
    end
  end

  def create
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)

  end

end
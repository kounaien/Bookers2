class UsersController < ApplicationController
  def show
  	@book = Book.new
  	@books = Book.all
  	@user = User.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully updated"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

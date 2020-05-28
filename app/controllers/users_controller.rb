class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_login_user

# booksの個々のユーザだけ
  def show
  	@book = Book.new
  	# @books = Book.all
    @user = User.find(params[:id])
    # @books = Book.where(user_id:@user.id)
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully saved"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :"index"
    end
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@users = User.all
  end



  def edit
  	@user = User.find(params[:id])
    if @user.id == current_user.id
      render action: :edit
    else
      redirect_to user_path(current_user.id)
    end
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

  protected
  def find_login_user
    @user = User.find(current_user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  

end

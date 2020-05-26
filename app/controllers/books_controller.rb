class BooksController < ApplicationController

	before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :destroy]

	def top
		if user_signed_in?
			redirect_to books_path
		end
	end

	def about
		
	end


	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
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

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully update"
			redirect_to book_path(@book.id)
		else
			flash.now[:aleart] = "There are some errors"
			render :'edit'
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		flash[:notice] = "Book was successfully destroyed"
		redirect_to books_path
	end


	private

	def book_params
		params.require(:book).permit(:title, :body)
	end

end

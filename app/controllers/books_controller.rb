class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  	@user = current_user
    @book_comments = BookComment.all
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  	@user = User.find(@books.user_id)
    @book_comment = BookComment.new
  end

  def create
  	@book = Book.new(book_params)
    @user = current_user
  	@book.user_id = current_user.id
  	if	@book.save
  		  redirect_to book_path(@book.id),flash:{success: "Book was successfully created."}
  	else
        @books = Book.all
  		  render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user == current_user
       render :edit
    else
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book.id),flash:{notice:"Book was successfully updated."}
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end

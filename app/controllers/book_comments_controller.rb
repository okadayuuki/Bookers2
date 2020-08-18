class BookCommentsController < ApplicationController
	def create
		@books = Book.find(params[:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		@book_comment.book_id = @books.id
		@book_comment.save
		redirect_to books_path
	end

	def destroy
		@book_comment = BookComment.find(params[:id])
		if @book_comment.user_id == current_user.id
		   BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
		   redirect_to books_path
		else
			redirect_to books_path
		end
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end

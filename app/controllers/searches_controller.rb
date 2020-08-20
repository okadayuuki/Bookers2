class SearchesController < ApplicationController

	def index
	end
	def search
		@user_or_book = params[:option]

		@how_search = params[:choice]
		if @user_or_book == "1"
			@users =User.search(params[:search], @user_or_book, @how_search)
			render 'index_result'
		else
			@books = Book.search(params[:search], @user_or_book, @how_search)
			render 'index_result'
		end
	end
end


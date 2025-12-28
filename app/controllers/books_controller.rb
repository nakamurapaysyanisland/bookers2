class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = @user.books
  end

  def create
    @book = @Book.new
    @book.user_id =current_user.id
    @book.save
    redirect_to book_path
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

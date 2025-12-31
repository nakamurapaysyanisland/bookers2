class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
    @book_new = Book.new 

  end

  def create
    @book_new = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] =  "You have created book successfully."
    else
      @books = Book.all
      @users = User.all
      @user = current_user
      render :index
    end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "Bookers
 Home
 Users
 Books
 Log out
You have updated book successfully."
        redirect_to book_path(@book)
      else
        render :edit
      end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book)
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

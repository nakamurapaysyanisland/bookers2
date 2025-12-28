class UsersController < ApplicationController

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books
    end

    def index
        @users = User.all
        @user = current_user
        @book = Book.new
    end
end

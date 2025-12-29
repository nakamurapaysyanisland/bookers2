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
        @books = Book.all
    end

    def Create
        @user = User.new
        @user = User.id 
        @user = User.save
        redirect_to user_path
    end
end

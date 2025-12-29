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

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

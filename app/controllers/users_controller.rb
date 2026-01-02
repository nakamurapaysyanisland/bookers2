class UsersController < ApplicationController
     before_action :authenticate_user!
 
     before_action :is_matching_login_user, only: [:edit, :update]
    def edit
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to users_path
        end
    end

    def show
        @user = User.find(params[:id])
        @books = @user.books
        @book_new = Book.new
    end

    def index
        @users = User.all
        @user = current_user
        @book_new = Book.new
        @books = Book.all
    end

    def Create
        @user = User.new
        @user = User.id 
        @user = User.save
        flash[:notice] = "Welcome! You have signed up successfully."
        redirect_to user_path
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] = "You have updated user successfully."
           redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        reset_session
        if @user.destroy(user_params)
           flash[:notice] ="Signed out successfully."
           redirect_to root_path
        else
        
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      # 自分の詳細画面（user_path(current_user)）へリダイレクト
      redirect_to user_path(current_user)
    end
  end
end

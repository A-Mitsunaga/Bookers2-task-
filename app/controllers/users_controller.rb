class UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only:[:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_param)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render action: :edit
    else
    redirect_to user_path
    end
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully updated."
    redirect_to user_path(@user.id)
    else
    render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
     user = User.find(params[:id])
     if user != current_user
      redirect_to user_path(current_user.id)
     end
  end

end

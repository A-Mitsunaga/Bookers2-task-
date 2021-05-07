class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def book_params
    params.require(:user).permit(:name, :profile_image)
    # 追加あるかも
  end


end

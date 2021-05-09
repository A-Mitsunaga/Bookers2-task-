class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @books = @user.books
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def create
    @book = Book.new(book_param)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@user.id)
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
  def user_params
    params.require(:user).permit(:name, :profile_image)
    # 追加あるかも
  end


end

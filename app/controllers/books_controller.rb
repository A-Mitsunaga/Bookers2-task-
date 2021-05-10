class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find_by(id: params[:id])
    @books = Book.all
    @user = current_user
    @bookn = Book.new
  end

  def destroy

  end


private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
    # 追加あるかも
  end

end

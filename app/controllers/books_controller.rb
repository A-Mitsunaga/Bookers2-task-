class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.find_by(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully saved."
      redirect_to book_path(@book.id)
    else
    @user = current_user
    render action: :index
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    @books = Book.all
    @user = Book.find(params[:id]).user
    @bookn = Book.new
    @users = User.find_by(id: params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    @book.destroy
    end
    redirect_to books_path
  end
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
      else
      flash[:notice] = "error"
      render action: :edit
      end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
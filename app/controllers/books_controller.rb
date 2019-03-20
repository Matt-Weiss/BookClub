class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    book.authors.create(name: author_params["authors"])
    redirect_to book_path(book)
  end


  private

  def book_params
    params.require(:book).permit(:title, :pages, :year_published, :thumbnail)
  end

  def author_params
    params.require(:book).permit(:authors)
  end
end

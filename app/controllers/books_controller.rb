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
    @book = Book.new(book_params)
    if @book.save
      author_strings = author_params[:author_names].split(",")  #split params into array of names
      author_strings.each do |author|
        author.strip
        @book.authors << Author.find_or_create_by(name: author)
      end
      redirect_to book_path(@book)
    else
      render :new
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :pages, :year_published, :thumbnail)
  end

  def author_params
    params.permit(:author_names)
  end
end

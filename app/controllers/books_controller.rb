class BooksController < ApplicationController
  def index
    if params[:sort] == "ratings_up"
      @books = Book.best_books.reorder("avg_rating ASC")
    elsif params[:sort] == "ratings_down"
      @books = Book.best_books
    elsif params[:sort] == "pages_up"
      @books = Book.order(:pages)
    elsif params[:sort] == "pages_down"
      @books = Book.order(pages: :desc)
    elsif params[:sort] == "reviews_down"
      @books = Book.review_count
    elsif params[:sort] == "reviews_up"
      @books = Book.review_count.reorder("review_count ASC")
    else
      @books = Book.all
    end
    @users_by_review_count = Review.prolific_users
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
      process_authors
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def process_authors
    author_strings = author_params[:author_names].split(",")  #split params into array of names
    author_strings.each do |author|
      sanitized_author = author.strip.titlecase
      @book.authors << Author.find_or_create_by(name: sanitized_author)
    end
  end

  private

  def book_params
    params[:book][:title] = params[:book][:title].titlecase
    if params[:book][:thumbnail] == ""
      params[:book][:thumbnail] = "https://bjwmartin.files.wordpress.com/2013/01/open_book_2.png"
    end
    params.require(:book).permit(:title, :pages, :year_published, :thumbnail)
  end

  def author_params
    params.permit(:author_names)
  end
end

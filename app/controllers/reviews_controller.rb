class ReviewsController < ApplicationController
  def new
    #refactor
    @book_review = Review.new
    @book = Book.find(params[:book_id])
  end

  def index(user = '_')
    user = params[:user]
    if params[:sort] == 'Oldest First'
      @reviews = Review.where(user_name: user).order(:created_at)
    else
      @reviews = Review.where(user_name: user).order('created_at DESC')
    end
  end

  def create
    @book = Book.find(params[:book_id])
    @book.reviews.no_duplicate_user_names(review_params)
    redirect_to book_path(@book)
  end

  # def delete
  #   review = Review.find(params[:id])
  #   user = review.user_name
  #   review.destroy
  #   if Review.find_by(user_name: user)
  #     render: :index
  #   else
  #     redirect_to books_path
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:user_name, :rating, :review_headline, :review_body)
  end
end

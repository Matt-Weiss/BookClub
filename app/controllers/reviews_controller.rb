class ReviewsController < ApplicationController
  def new
    #refactor
    @book_review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @book.reviews.no_duplicate_user_names(review_params)
    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:user_name, :rating, :review_headline, :review_body)
  end
end

class Review < ApplicationRecord
  validates_presence_of :user_name
  validates_presence_of :rating
  validates_presence_of :review_headline
  validates_presence_of :review_body
  belongs_to :book

  def self.no_duplicate_user_names(review_params)
    create_with(review_body: review_params[:review_body], review_headline: review_params[:review_headline], rating: review_params[:rating]).find_or_create_by(user_name: review_params[:user_name])
  end

  def rating_number_limiter
    false if rating > 5 || rating < 0
    true 
  end
end

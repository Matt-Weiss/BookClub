class Review < ApplicationRecord
  validates_presence_of :user_name
  validates_presence_of :rating
  validates_presence_of :review_headline
  validates_presence_of :review_body
  belongs_to :book

  def self.no_duplicate_user_names(review_params)
    titleized_user = review_params[:user_name].titlecase
    create_with(review_body: review_params[:review_body], review_headline: review_params[:review_headline], rating: review_params[:rating]).find_or_create_by(user_name: titleized_user )
  end

  def self.overall_rating
    if average(:rating)
      average(:rating).round(1)
    end
  end

  def self.best_reviews
    order(rating: :desc).limit(3)
  end

  def self.worst_reviews
    order(:rating).limit(3)
  end

  def self.avg_review_score
    if first
      average(:rating).round(2)
    else
      "na"
    end
  end

  def self.review_count
    count(:id)
  end

  def self.author_page_review
    order(rating: :desc).first
  end

  def self.prolific_users
    select("reviews.user_name, count(reviews.user_name) as prolific_user").group(:user_name).order("prolific_user DESC")
  end


end

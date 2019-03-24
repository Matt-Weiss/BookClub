class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_published
  validates_presence_of :thumbnail
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors
  validates :title, uniqueness: true

  def best_reviews
    reviews.order(rating: :desc).limit(3)
  end

  def worst_reviews
    reviews.order(:rating).limit(3)
  end

  def avg_review_score
    if reviews.first
      reviews.average(:rating).round(2)
    else
      "n/a"
    end
  end

  def review_count
    reviews.count(:id)
  end
end

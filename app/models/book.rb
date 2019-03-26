class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_published
  validates_presence_of :thumbnail
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors
  validates :title, uniqueness: true


  def self.best_books
    joins(:reviews).select("books.*, avg(reviews.rating) as avg_rating").group(:id).order("avg_rating DESC")
  end

  def self.review_count
    joins(:reviews).select("books.*, count(reviews.book_id) as review_count").group(:id).order("review_count DESC")
  end

end

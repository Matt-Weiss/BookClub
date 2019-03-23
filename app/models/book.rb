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
    sorted_reviews = reviews.order(:rating)
    [sorted_reviews[-1],sorted_reviews[-2],sorted_reviews[-3]]
  end

end

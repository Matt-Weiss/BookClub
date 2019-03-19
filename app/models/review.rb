class Review < ApplicationRecord
  validates_presence_of :user_name
  validates_presence_of :rating
  validates_presence_of :review_headline
  validates_presence_of :review_body
  belongs_to :book 
end

require 'rails_helper'

RSpec.describe Review, type: :model do
  # describe 'relationships' do
  #   it {should have_many :reviews}
  #   it {should belong_to :book_author}
  #   it {should have_many(:authors).through :book_author}
  # end
  describe 'validations' do
    it {should validate_presence_of :user_name}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :review_headline}
    it {should validate_presence_of :review_body}
  end
end

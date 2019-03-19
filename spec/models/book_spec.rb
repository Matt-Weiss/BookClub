require 'rails_helper'

RSpec.describe Book, type: :model do
  # describe 'relationships' do
  #   it {should have_many :reviews}
  #   it {should belong_to :book_author}
  #   it {should have_many(:authors).through :book_author}
  # end
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :page_count}
    it {should validate_presence_of :year_published}
    it {should validate_presence_of :thumbnail}
  end 
end

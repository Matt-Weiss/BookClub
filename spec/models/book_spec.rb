require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do
    it {should have_many :reviews}
    it {should have_many :book_authors}
    it {should have_many(:authors).through :book_authors}
  end
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :year_published}
    it {should validate_presence_of :thumbnail}
    it {should validate_uniqueness_of(:title)}
  end
end

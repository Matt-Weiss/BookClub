require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it {should have_many :book_author}
    it {should have_many(:books).through :book_author}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
  end
end

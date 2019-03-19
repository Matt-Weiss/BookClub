require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many :reviews}
    it {should belong_to :book_author}
    it {should have_many(:authors).through :book_author}
  end
end

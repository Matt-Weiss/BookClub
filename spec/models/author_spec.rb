require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it {should belong_to :book_author}
    it {should have_many(:books).through :book_author}
  end
end

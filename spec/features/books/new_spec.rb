require 'rails_helper'

RSpec.describe 'new book page', type: :feature do
  it 'shows form and creates book correctly' do
    visit new_book_path
      fill_in 'book[title]', with: 'Lord Of The Rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'Tolkien'
      click_button 'Create Book'
      book = Book.last
      expect(current_path).to eq(book_path(book))
      expect(page).to have_content('Lord Of The Rings')
      expect(page).to have_content('Tolkien')
  end



end

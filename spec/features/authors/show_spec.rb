require 'rails_helper'

RSpec.describe 'at the author show page', type: :feature do
  it 'shows all books by an author' do

    visit new_book_path
      fill_in 'book[title]', with: 'Lord Of The Rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'Tolkien'
      click_button 'Create Book'
    visit new_book_path
      fill_in 'book[title]', with: 'Lord Of The Rings2'
      fill_in 'book[year_published]', with: 2013
      fill_in 'book[pages]', with: 456
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'Tolkien'
      click_button 'Create Book'

      click_link 'Tolkien'

      expect(page).to have_content('Lord Of The Rings')
      expect(page).to have_content('Lord Of The Rings2')

  end
end




  # I see all books by that author
  # Each book should show:
  # - the book title
  # - the number of pages in the book
  # - the year the book was published
  # - a small image of the book cover

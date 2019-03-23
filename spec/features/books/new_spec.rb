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

  describe 'sad path' do
    it 'redirects the user back to their form if the book is rejected' do
      visit new_book_path

      fill_in 'book[title]', with: 'Lord Of The Rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'Tolkien'
      click_button 'Create Book'

      visit new_book_path

      fill_in 'book[title]', with: 'Lord Of The Rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'Tolkien'
      click_button 'Create Book'

      expect(current_path).to eq(books_path)
      expect(page).to have_content('Thumbnail')
    end

    it 'titlecases author input' do
      visit new_book_path

      fill_in 'book[title]', with: 'Lord Of The Rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'tolkien'
      click_button 'Create Book'

      book = Book.last
      expect(current_path).to eq(book_path(book))
      expect(page).to have_content('Tolkien')
    end

    it 'titlecases book title' do
      visit new_book_path

      fill_in 'book[title]', with: 'lord of the rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 315
      fill_in 'book[thumbnail]', with: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg'
      fill_in 'author_names', with: 'tolkien'
      click_button 'Create Book'

      book = Book.last
      expect(current_path).to eq(book_path(book))
      expect(page).to have_content('Lord Of The Rings')
    end

    it 'fills in a default image if thumbnail is left blank' do
      visit new_book_path

      fill_in 'book[title]', with: 'lord of the rings'
      fill_in 'book[year_published]', with: 2012
      fill_in 'book[pages]', with: 312
      fill_in 'author_names', with: 'tolkien'
      click_button 'Create Book'

      book = Book.last
      expect(current_path).to eq(book_path(book))
      expect(page).to have_xpath("/html/body/div[1]/img")
    end
  end
end 

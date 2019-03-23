require 'rails_helper'

RSpec.describe 'at the author show page', type: :feature do
  it 'shows all books by an author' do

    author = Author.create(name: 'Tolkien')
    book_1 = author.books.create(title: 'Lord Of The Rings', year_published: 2012, pages: 315, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')
    book_2 = author.books.create(title: 'Lord Of The Rings2', year_published: 2013, pages: 456, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')

    visit book_path(book_1)
    click_link 'Tolkien'

    expect(current_path).to eq(author_path(author))
    #move the above 3 lines to book/show_spec?
    expect(page).to have_content('Lord Of The Rings')
    expect(page).to have_content('2012')
    expect(page).to have_content('315')
    expect(page).to have_xpath("/html/body/ul/img[1]")
    expect(page).to have_content('Lord Of The Rings2')
    expect(page).to have_content('2013')
    expect(page).to have_content('456')
    expect(page).to have_xpath("/html/body/ul/img[2]")
  end

  it 'shows additional authors without showing author whose page this is' do
    book = Book.create(title: 'Lord Of The Rings', year_published: 2012, pages: 315, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')
    author_1 = book.authors.create(name: 'Tolkien')
    author_2 = book.authors.create(name: 'Matt Weiss')

    visit author_path(author_1)
    
    expect(page).to_not have_link('Tolkien')
    expect(page).to have_link('Matt Weiss')
  end

end

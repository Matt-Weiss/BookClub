require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  it 'shows all books' do
    book_1 = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    book_2 = Book.create(title: 'CSSuckit', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')

    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.year_published)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_2.year_published)
  end
end

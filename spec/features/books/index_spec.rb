require 'rails_helper'

RSpec.describe 'book index page', type: :feature do

  before(:each) do
    @astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    @css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')

    @astronaut.authors.create(name: "Chris Hadfield")
    @css.authors.create(name: "Matt Weiss")

    @astronaut.reviews.create(user_name: "bob123",rating: 2,review_headline: "Good",review_body: "Good book, space good, space fun")
    @css.reviews.create(user_name: "joe876",rating: 3,review_headline: "BAD :(",review_body: "Css made me want to eat nails nad snails")
  end

  it 'shows all books' do

  visit books_path

    expect(page).to have_content(@astronaut.title)
    expect(page).to have_content(@astronaut.pages)
    expect(page).to have_content(@astronaut.year_published)
    expect(page).to have_content(@css.title)
    expect(page).to have_content(@css.pages)
    expect(page).to have_content(@css.year_published)
  end

  it 'book titles are links to book show page' do

    visit books_path

    click_on @astronaut.title

    expect(current_path).to eq(book_path(@astronaut))
  end

end

require 'rails_helper'

RSpec.describe 'book index page', type: :feature do

  before(:each) do
    @astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    @css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')
    @no_review = Book.create(title: 'Book', pages: 12, year_published: 2019, thumbnail: 'https://upload.wikimedia.org/wikipedia/en/thumb/9/99/Question_book-new.svg/986px-Question_book-new.svg.png')

    @astronaut.authors.create(name: "Chris Hadfield")
    @css.authors.create(name: "Matt Weiss, Mike Karnes")
    @no_review.authors.create(name: 'Matt Weiss')

    @astronaut.reviews.create(user_name: "bob123",rating: 3,review_headline: "Good",review_body: "Good book, space good, space fun")
    @astronaut.reviews.create(user_name: "bob123",rating: 4,review_headline: "Good2",review_body: "Good book2, space good2, space fun2")
    @css.reviews.create(user_name: "joe876",rating: 3,review_headline: "BAD :(",review_body: "Css made me want to eat nails nad snails")
  end

  it 'shows all books' do

  visit books_path

    expect(page).to have_content(@astronaut.title)
    expect(page).to have_content(@astronaut.authors.first.name)
    expect(page).to have_content(@astronaut.pages)
    expect(page).to have_content(@astronaut.year_published)
    expect(page).to have_content(@css.title)
    expect(page).to have_content(@css.authors.first.name)
    expect(page).to have_content(@css.authors.last.name)
    expect(page).to have_content(@css.pages)
    expect(page).to have_content(@css.year_published)
  end

  it 'book titles are links to book show page' do

    visit books_path
    expect(page).to have_link("See More", :href=>book_path(@astronaut))
    expect(page).to have_link("See More", :href=>book_path(@css))
  end

  it 'book authors are links to author show page' do

    visit books_path

    click_on @astronaut.authors.first.name

    expect(current_path).to eq(author_path(@astronaut.authors.first))
  end

  it 'book cards contain average rating' do

    visit books_path

    expect(page).to have_content('Average Review Score: 3.0/5')
    expect(page).to have_content('Total Reviews: 2')
    expect(page).to have_content('Average Review Score: na/5')
  end

  it 'shows best and worst books and most prolific user' do

    visit books_path

    within("table") do
      expect(page).to have_content('Top 3 Books Worst 3 Books Most prolific users')
      expect(page).to have_content("An Astronaut's Guide to Life on Earth 3.5/5 CSSucks 3.0/5 User Name: bob123 Number of Reviews: 2 CSSucks 3.0/5 An Astronaut's Guide to Life on Earth 3.5/5 User Name: joe876 Number of Reviews: 1")
    end
  end

  it 'can sort several ways' do

    visit books_path

    click_on "Review Count(Highest First)"
    expect(page).to have_content("An Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2\nSee More\nCSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1")

    click_on "Review Count(Lowest First)"
    expect(page).to have_content("CSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1\nSee More\nAn Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2")

    click_on "Ratings(Highest First)"
    expect(page).to have_content("An Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2\nSee More\nCSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1")

    click_on "Ratings(Lowest First)"
    expect(page).to have_content("CSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1\nSee More\nAn Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2")

    click_on "Page Count(Highest First)"
    expect(page).to have_content("CSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1\nSee More\nAn Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2")

    click_on "Page Count(Lowest First)"
    expect(page).to have_content("An Astronaut's Guide to Life on Earth\nAuthors: Chris Hadfield Pages: 284 Published: 2013 Average Review Score: 3.5/5 Total Reviews: 2\nSee More\nCSSucks\nAuthors: Matt Weiss, Mike Karnes Pages: 420 Published: 2019 Average Review Score: 3.0/5 Total Reviews: 1")

  end
end

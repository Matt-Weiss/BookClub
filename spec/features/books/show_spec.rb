require 'rails_helper'

RSpec.describe 'book show page', type: :feature do
  it 'shows all book traits and reviews' do
  astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
  astronaut.authors.create(name: "Chris Hadfield")
  astronaut.reviews.create(user_name: "bob123",rating: 2,review_headline: "Good",review_body: "Good book, space good, space fun")

  visit book_path(astronaut)
  expect(page).to have_content(astronaut.title)
  expect(page).to have_content(astronaut.pages)
  expect(page).to have_content(astronaut.year_published)
  expect(page).to have_content(astronaut.authors.name)
  expect(page).to have_content(astronaut.reviews.last.user_name)
  expect(page).to have_content(astronaut.reviews.last.rating)
  expect(page).to have_content(astronaut.reviews.last.review_headline)
  expect(page).to have_content(astronaut.reviews.last.review_body)
  end
end

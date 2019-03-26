require 'rails_helper'

RSpec.describe 'User review show page' do
  it 'should show all reviews from a user' do
    book = Book.create(title: "bob", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book_2 = Book.create(title: "second book", pages: 1231, year_published: 1321, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book.authors.create(name: "Matt Weiss")
    book_2.authors.create(name: "Mike Karnes")
    book.reviews.create(user_name: "idek", review_headline: "first review", review_body: "good", rating: 4)
    book_2.reviews.create(user_name: "idek", review_headline: "second review", review_body: "bad", rating: 3)

    visit book_path(book)
    click_on "idek"
    expect(current_path).to eq(reviews_path)
    expect(page).to have_content("bob")
    expect(page).to have_content("second book")
    expect(page).to have_content("first review")
    expect(page).to have_content("second review")
    expect(page).to have_content("good")
    expect(page).to have_content("bad")
    expect(page).to have_content(book.reviews.first.created_at)
    expect(page).to have_content(book.reviews.last.created_at)

  end

end

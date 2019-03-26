require 'rails_helper'

RSpec.describe 'User review show page' do
  it 'should show all reviews from a user' do
    book = Book.create(title: "first book", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book_2 = Book.create(title: "second book", pages: 1231, year_published: 1321, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book.authors.create(name: "Matt Weiss")
    book_2.authors.create(name: "Mike Karnes")
    book.reviews.create(user_name: "idek", review_headline: "first review", review_body: "good", rating: 4)
    book.reviews.create(user_name: "evilguy", review_headline: "shouldnt be here", review_body: "good", rating: 4)
    book_2.reviews.create(user_name: "idek", review_headline: "second review", review_body: "bad", rating: 3)
    book_2.reviews.create(user_name: "evilguy", review_headline: "shouldnt be here", review_body: "bad", rating: 3)
    visit book_path(book)
    within('#first') do
      click_on "idek"
    end
    expect(current_path).to eq(reviews_path)
    expect(page).to have_content("first book")
    expect(page).to have_content("second book")
    expect(page).to have_content("first review")
    expect(page).to have_content("second review")
    expect(page).to_not have_content("shouldnt be here")
    expect(page).to_not have_content("evilguy")
    expect(page).to have_content("good")
    expect(page).to have_content("bad")
    expect(page).to have_content(book.reviews.first.created_at)
    expect(page).to have_content(book.reviews.last.created_at)

  end

  it 'should be able to sort reviews by date' do
    book = Book.create(title: "first book", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book_2 = Book.create(title: "second book", pages: 1231, year_published: 1321, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book.authors.create(name: "Matt Weiss")
    book_2.authors.create(name: "Mike Karnes")
    book.reviews.create(user_name: "idek", review_headline: "first review", review_body: "good", rating: 4)
    book.reviews.create(user_name: "evilguy", review_headline: "second", review_body: "good", rating: 4)
    book_2.reviews.create(user_name: "idek", review_headline: "second review", review_body: "bad", rating: 3)
    book_2.reviews.create(user_name: "evilguy", review_headline: "shouldnt be here", review_body: "bad", rating: 3)

    visit book_path(book)
    within('#first') do
      click_on "idek"
    end
    expect(current_path).to eq(reviews_path)
    click_on 'Oldest First'
    expect(page).to have_content(book.reviews.first.review_headline)
    expect(page).to have_content(book_2.reviews.first.review_headline)
    click_on 'Newest First'
    expect(page).to have_content(book_2.reviews.first.review_headline)
    expect(page).to have_content(book.reviews.first.review_headline)
  end


  it 'should allow each review to be deleted via ajecent buttons' do
    book = Book.create(title: "first book", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book_2 = Book.create(title: "second book", pages: 1231, year_published: 1321, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    book.authors.create(name: "Matt Weiss")
    book.reviews.create(user_name: "idek", review_headline: "first review", review_body: "good", rating: 4)
    book_2.reviews.create(user_name: "idek", review_headline: "second review", review_body: "bad", rating: 3)

    visit book_path(book)
    within('#first') do
      click_on "idek"
    end
    expect(current_path).to eq(reviews_path)
    click_on 'delete review'
    expect(current_path).to eq(reviews_path)
    click_on 'delete review'
    expect(current_path).to eq(books_path)
  end
end

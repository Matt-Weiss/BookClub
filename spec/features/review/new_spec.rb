require 'rails_helper'

RSpec.describe 'Review Creation Workflow' do
  it 'should be redirected to from book show' do
    book = Book.create(title: "bob", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    visit book_path(book.id)
    click_on 'new'
    expect(current_path).to eq(new_book_review_path(book))

  end
  it 'creates review correctly' do
    book = Book.create(title: "bob", pages: 195, year_published: 1990, thumbnail: "https://www.bookbaby.com/images/book-cover-design-basic.png")
    visit book_path(book)
    click_link 'new'
    expect(current_path).to eq(new_book_review_path(book))
    visit new_book_review_path(book)
    fill_in 'review[user_name]', with: "cookiesrgood"
    fill_in 'review[rating]', with: 4
    fill_in 'review[review_headline]', with: "THIS IS A BOOK"
    fill_in 'review[review_body]', with: "this is a review, full of opinions"
    click_on 'Create Review'
    expect(current_path).to eq(book_path(book))
    click_link 'new'
    fill_in 'review[user_name]', with: "cookiesrgood"
    fill_in 'review[rating]', with: 3
    fill_in 'review[review_headline]', with: "lol i made 2 reviews"
    fill_in 'review[review_body]', with: "2 time"
    click_on 'Create Review'
    expect(current_path).to eq(book_path(book))
    expect(page).to_not have_content("lol i made 2 reviews")
    expect(page).to_not have_content(3)
    expect(page).to_not have_content("2 time")
  end

  # it 'limits the value a rating can be' 

end

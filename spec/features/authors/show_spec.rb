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
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.year_published)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_xpath("/html/body/ul/img[1]")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.year_published)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_xpath("/html/body/ul/img[2]")
  end

  it 'shows additional authors without showing author whose page this is' do
    book = Book.create(title: 'Lord Of The Rings', year_published: 2012, pages: 315, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')
    author_1 = book.authors.create(name: 'Tolkien')
    author_2 = book.authors.create(name: 'Matt Weiss')

    visit author_path(author_1)

    expect(page).to_not have_link(author_1.name)
    expect(page).to have_link(author_2.name)
  end

  it 'should display proper stats' do
    author = Author.create(name: 'Tolkien')
    book_1 = author.books.create(title: 'Lord Of The Rings', year_published: 2012, pages: 315, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')
    book_2 = author.books.create(title: 'Lord Of The Rings2', year_published: 2013, pages: 456, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg')
    review_1 = book_1.reviews.create(review_headline: "top review", review_body: "im the best review", rating: 5, user_name: "blah")
    review_2 = book_1.reviews.create(review_headline: "not the top review", review_body: "im not the top review", rating: 2, user_name: "bob")
    review_3 = book_2.reviews.create(review_headline: "top review", review_body: "im the best review", rating: 5, user_name: "bob")
    review_4 = book_2.reviews.create(review_headline: "not the top review", review_body: "im not the top review", rating: 2, user_name: "blah")

    visit author_path(author)

    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.user_name)

    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_2.user_name)
  end
end

require 'rails_helper'

RSpec.describe 'book show page', type: :feature do
  it 'shows all book traits' do
    astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')
    astronaut.authors.create(name: "Chris Hadfield")

    visit book_path(astronaut)

    expect(page).to have_content(astronaut.title)
    expect(page).to have_content(astronaut.pages)
    expect(page).to have_content(astronaut.year_published)
    expect(page).to have_content(astronaut.authors.name[0])
    expect(page).to_not have_content(css.title)
    expect(page).to_not have_content(css.pages)
    expect(page).to_not have_content(css.year_published)

  end


  it 'shows all reviews traits' do
    astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')
    astronaut.authors.create(name: "Chris Hadfield")
    astronaut.reviews.create(user_name: "bob123",rating: 2,review_headline: "Good",review_body: "Good book, space good, space fun")
    astronaut.reviews.create(user_name: "joe876",rating: 3,review_headline: "BAD :(",review_body: "Css made me want to eat nails nad snails")

    visit book_path(astronaut)

    expect(page).to have_content(astronaut.reviews.last.user_name)
    expect(page).to have_content(astronaut.reviews.last.rating)
    expect(page).to have_content(astronaut.reviews.last.review_headline)
    expect(page).to have_content(astronaut.reviews.last.review_body)
    expect(page).to have_content(astronaut.reviews[-2].user_name)
    expect(page).to have_content(astronaut.reviews[-2].rating)
    expect(page).to have_content(astronaut.reviews[-2].review_headline)
    expect(page).to have_content(astronaut.reviews[-2].review_body)
  end

  it 'book authors are links to author show page' do
    astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')
    astronaut.authors.create(name: "Chris Hadfield")
    astronaut.reviews.create(user_name: "bob123",rating: 2,review_headline: "Good",review_body: "Good book, space good, space fun")
    astronaut.reviews.create(user_name: "joe876",rating: 3,review_headline: "BAD :(",review_body: "Css made me want to eat nails nad snails")

    visit book_path(astronaut)
    click_on astronaut.authors.last.name
    expect(current_path).to eq(author_path(astronaut.authors.last))
  end

  it 'shows proper book statistics' do
    astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
    astronaut.authors.create(name: "Chris Hadfield")
    astronaut.reviews.create(user_name: "bob123",rating: 5,review_headline: "Good",review_body: "Good book, space good, space fun")
    astronaut.reviews.create(user_name: "joe876",rating: 5,review_headline: "BAD :(",review_body: "Css made me want to eat nails nad snails")
    astronaut.reviews.create(user_name: "hsju",rating: 4,review_headline: "luehdwd",review_body: "ljknrfwdilnfdhdedfoisw")
    astronaut.reviews.create(user_name: "ksoa",rating: 3,review_headline: "luehdwd",review_body: "ljknrfwdilnfdhdedfoisw")
    astronaut.reviews.create(user_name: "qor",rating: 2,review_headline: "luehdwd",review_body: "ljknrfwdilnfdhdedfoisw")
    astronaut.reviews.create(user_name: "vmna",rating: 1,review_headline: "luehdwd",review_body: "ljknrfwdilnfdhdedfoisw")
    visit book_path(astronaut)
    expect(page).to have_content("Overall Rating: 3.3/5")
 

  end

end

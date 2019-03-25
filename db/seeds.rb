# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year_published: 2013, thumbnail: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
css = Book.create(title: 'CSSucks', pages: 420, year_published: 2019, thumbnail: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')
hunger = Book.create(title: 'The Hunger Games', pages: 374, year_published: 2008, thumbnail: 'https://images.gr-assets.com/books/1447303603l/2767052.jpg')
potter = Book.create(title: 'Harry Potter and the Order of the Phoenix', pages: 870, year_published: 2003, thumbnail: 'https://images.gr-assets.com/books/1546910265l/2.jpg')
mockingbird = Book.create(title: 'To Kill a Mockingbird', pages: 324, year_published: 1960, thumbnail: 'https://images.gr-assets.com/books/1552035043l/2657.jpg')
pride = Book.create(title: 'Pride And Prejudice', pages: 279, year_published: 1813, thumbnail: 'https://images.gr-assets.com/books/1320399351l/1885.jpg')
narnia = Book.create(title: 'The Chronicles of Narnia', pages: 767, year_published: 1956, thumbnail: 'https://images.gr-assets.com/books/1449868701l/11127.jpg')
farm = Book.create(title: 'Animal Farm', pages: 122, year_published: 1945, thumbnail: 'https://images.gr-assets.com/books/1424037542l/7613.jpg')
hobbit = Book.create(title: 'The Hobbit', pages: 310, year_published: 1937, thumbnail: 'https://g.christianbook.com/g/slideshow/9/928227/main/928227_1_ftc.jpg')
fellowship = Book.create(title: 'The Fellowship Of The Rings', pages: 423, year_published: 1954, thumbnail: 'http://images.mentalfloss.com/sites/default/files/styles/width-constrained-728/public/507311-_amazon91jbdarvqml.jpg')
towers = Book.create(title: 'The Two Towers', pages: 352, year_published: 1954, thumbnail: 'http://img1.imagesbn.com/p/9780547952024_p0_v1_s260x420.JPG')
king = Book.create(title: 'The Return Of The King', pages: 416, year_published: 1955, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/41Qx%2BidkxsL.jpg')

astronaut.authors << Author.find_or_create_by(name: 'Chris Hadfield')
css.authors << Author.find_or_create_by(name: 'Matt Weiss')
hunger.authors << Author.find_or_create_by(name: 'Suzanne Collins')
potter.authors << Author.find_or_create_by(name: 'J.K. Rowling')
mockingbird.authors << Author.find_or_create_by(name: 'Harper Lee')
pride.authors << Author.find_or_create_by(name: 'Jane Austen')
pride.authors << Author.find_or_create_by(name: 'Anna Quindlen')
narnia.authors << Author.find_or_create_by(name: 'C.S. Lewis')
narnia.authors << Author.find_or_create_by(name: 'Pauline Baynes')
farm.authors << Author.find_or_create_by(name: 'George Orwell')
hobbit.authors << Author.find_or_create_by(name: 'J.R.R. Tolkien')
fellowship.authors << Author.find_or_create_by(name: 'J.R.R. Tolkien')
towers.authors << Author.find_or_create_by(name: 'J.R.R. Tolkien')
king.authors << Author.find_or_create_by(name: 'J.R.R. Tolkien')

astronaut.reviews.create_with(review_body: "I have so many good things to say about this book I don't think they'll all fit into one review (for my full review, including my four-year-old's reaction to it, please visit my blog, Cozy Little Book Journal).", review_headline: 'I have so many good things to say about this book', rating: 5).find_or_create_by(user_name: 'CozyLittleBookJournal')
astronaut.reviews.create_with(review_body: "Have you ever wanted to know the life of an astronaut? How do you even get to be one? What do they do, especially when on earth? Why do they even do it? And how do you combine that with having a family? This wonderful new book will tell you all about it.", review_headline: 'Have you ever wanted to know the life of an astronaut?', rating: 5).find_or_create_by(user_name: 'Anonymous')
astronaut.reviews.create_with(review_body: 'I hate space for some reason', review_headline: 'Boo Space', rating: 2).find_or_create_by(user_name: 'spacehater123')
astronaut.reviews.create_with(review_body: 'I also hate space for some reason', review_headline: 'Boo Space2', rating: 1).find_or_create_by(user_name: 'spacehater456')
astronaut.reviews.create_with(review_body: 'That was way more exciting', review_headline: "Wasn't The Martian based on a true story?", rating: 3).find_or_create_by(user_name: 'thatoneexgirlfriend')
astronaut.reviews.create_with(review_body: 'I guess they can if you take videos and post them on youtube', review_headline: 'In space, no one can hear you play guitar', rating: 4).find_or_create_by(user_name: 'space good')

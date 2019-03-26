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
astronaut.reviews.create_with(review_body: 'I hate space for some reason', review_headline: 'Boo Space', rating: 2).find_or_create_by(user_name: 'Spacehater123')
astronaut.reviews.create_with(review_body: 'I also hate space for some reason', review_headline: 'Boo Space2', rating: 1).find_or_create_by(user_name: 'Spacehater456')
astronaut.reviews.create_with(review_body: 'That was way more exciting', review_headline: "Wasn't The Martian based on a true story?", rating: 3).find_or_create_by(user_name: 'Thatoneexgirlfriend')
astronaut.reviews.create_with(review_body: 'I guess they can if you take videos and post them on youtube', review_headline: 'In space, no one can hear you play guitar', rating: 4).find_or_create_by(user_name: 'Space Good')

css.reviews.create_with(review_body: "Make Your Psychiatrist Go To The Gym More", review_headline: "Scary Truths That Will", rating: "1").find_or_create_by(user_name: "CozyLittleBookJournal")
css.reviews.create_with(review_body: "Agriculture Secretary Thomas J. Vilsack", review_headline: "Photoshop Tips From", rating: "2").find_or_create_by(user_name: "Ronald Ward")
css.reviews.create_with(review_body: "Keep To Themselves", review_headline: "Secrets Accountants", rating: "3").find_or_create_by(user_name: "Dell MacApple")
css.reviews.create_with(review_body: "6 Practical Beard Care Tips", review_headline: "Scarlett Johansson's", rating: "4").find_or_create_by(user_name: "Demetrius Levenworth")
css.reviews.create_with(review_body: "Ernest Moniz Save Skin Care?", review_headline: "Will Energy Secretary", rating: "5").find_or_create_by(user_name: "Ed Bed")
css.reviews.create_with(review_body: "Thinks About In The Bathroom", review_headline: "Facts Your Elected Official", rating: "3").find_or_create_by(user_name: "Stegosaurus Jones")

hunger.reviews.create_with(review_body: "Secrets From Batman", review_headline: "Hilarious Dental Care", rating: "1").find_or_create_by(user_name: "CozyLittleBookJournal")
hunger.reviews.create_with(review_body: "Make Psychologists Feel Ashamed", review_headline: "Shocking Things That", rating: "3").find_or_create_by(user_name: "AmericaSolid")
hunger.reviews.create_with(review_body: "Your Web Designer Feel More Attractive", review_headline: "Incredible Facts That Will Make", rating: "3").find_or_create_by(user_name: "Dell MacApple")
hunger.reviews.create_with(review_body: "Receptionists Won't Tell Their Friends", review_headline: "Staggering Things", rating: "4").find_or_create_by(user_name: "Ed Bed")
hunger.reviews.create_with(review_body: "Save Trumpet Playing?", review_headline: "Can Martin Scorsese", rating: "5").find_or_create_by(user_name: "Tex Montreal")
hunger.reviews.create_with(review_body: "Surprising Metallurgy Secrets", review_headline: "Ashton Kutcher's 15", rating: "3").find_or_create_by(user_name: "Monica Labrador")

potter.reviews.create_with(review_body: "Your Senator Will Never Learn", review_headline: "Troubling Truths", rating: "1").find_or_create_by(user_name: "Ronald Ward")
potter.reviews.create_with(review_body: "About Lady Gaga", review_headline: "Scandalous Truths", rating: "4").find_or_create_by(user_name: "AmericaSolid")
potter.reviews.create_with(review_body: "Awesome Archery Tips", review_headline: "Kanye West's Top 6", rating: "3").find_or_create_by(user_name: "Demetrius Levenworth")
potter.reviews.create_with(review_body: "That Make Plumbers Nervous", review_headline: "Horrible Secrets", rating: "3").find_or_create_by(user_name: "Ed Bed")
potter.reviews.create_with(review_body: "Tips From Jay-Z", review_headline: "Sexy Speed Skating", rating: "4").find_or_create_by(user_name: "Tex Montreal")
potter.reviews.create_with(review_body: "About Soldering", review_headline: "The Embarassing Truth", rating: "5").find_or_create_by(user_name: "Molly Popper")

mockingbird.reviews.create_with(review_body: "CEOs Write In Their Journals", review_headline: "Hilarious Truths", rating: "1").find_or_create_by(user_name: "Ronald Ward")
mockingbird.reviews.create_with(review_body: "David Wichmann's 10 Amazing Halo Tips", review_headline: "UnitedHealth CEO", rating: "5").find_or_create_by(user_name: "Dell MacApple")
mockingbird.reviews.create_with(review_body: "Tips From AT&T CEO Randall L. Stephenson", review_headline: "Big Wave Surfing", rating: "3").find_or_create_by(user_name: "Ed Bed")
mockingbird.reviews.create_with(review_body: "Your Doctor Is Using Against You", review_headline: "Unbelievable Facts", rating: "3").find_or_create_by(user_name: "Stegosaurus Jones")
mockingbird.reviews.create_with(review_body: "Make Therapists Afraid", review_headline: "Secrets That", rating: "4").find_or_create_by(user_name: "Monica Labrador")
mockingbird.reviews.create_with(review_body: "Make Your Contractor Feel Sexually Confused", review_headline: "5 Things That Will", rating: "5").find_or_create_by(user_name: "Molly Popper")

pride.reviews.create_with(review_body: "Save Papercraft?", review_headline: "Will William Shatner", rating: "1").find_or_create_by(user_name: "AmericaSolid")
pride.reviews.create_with(review_body: "Physicians Won't Admit", review_headline: "Amazing Truths", rating: "2").find_or_create_by(user_name: "Dell MacApple")
pride.reviews.create_with(review_body: "Boyfriends Eat More Vegetables", review_headline: "Secrets That Make", rating: "3").find_or_create_by(user_name: "Tex Montreal")
pride.reviews.create_with(review_body: "12 Shocking Tree Pruning Tips", review_headline: "Arnold Schwarzenegger's", rating: "3").find_or_create_by(user_name: "Monica Labrador")
pride.reviews.create_with(review_body: "From Bill Gates", review_headline: "Leaf Blowing Secrets", rating: "4").find_or_create_by(user_name: "Molly Popper")
pride.reviews.create_with(review_body: "Family Doctors Don't Like To Think About", review_headline: "Mind-Blowing Secrets", rating: "4").find_or_create_by(user_name: "Emma Stout")

narnia.reviews.create_with(review_body: "That Will Make Your Neighbor Angry", review_headline: "Jaw-Dropping Things", rating: "1").find_or_create_by(user_name: "Ronald Ward")
narnia.reviews.create_with(review_body: "That Make Attorneys Feel Aroused", review_headline: "Surprising Facts", rating: "2").find_or_create_by(user_name: "AmericaSolid")
narnia.reviews.create_with(review_body: "About The ghost of Steve Jobs", review_headline: "The Alarming Truth", rating: "3").find_or_create_by(user_name: "Demetrius Levenworth")
narnia.reviews.create_with(review_body: "Top 20 Javascript Tips", review_headline: "Will Smith's", rating: "4").find_or_create_by(user_name: "Ed Bed")
narnia.reviews.create_with(review_body: "Publicist Is Hiding From You", review_headline: "Truths Your", rating: "4").find_or_create_by(user_name: "Monica Labrador")
narnia.reviews.create_with(review_body: "Your Proctologist Gets Choked Up About", review_headline: "Terrifying Things", rating: "5").find_or_create_by(user_name: "Emma Stout")

farm.reviews.create_with(review_body: "That Will Make Your Urologist Sleepy", review_headline: "Frightening Secrets", rating: "5").find_or_create_by(user_name: "CozyLittleBookJournal")
farm.reviews.create_with(review_body: "Fathers Nervous", review_headline: "Truths That Make", rating: "5").find_or_create_by(user_name: "Ronald Ward")
farm.reviews.create_with(review_body: "Secrets From Johnny Depp", review_headline: "Unbelievable Frisbee Golf", rating: "3").find_or_create_by(user_name: "Stegosaurus Jones")
farm.reviews.create_with(review_body: "About Pet Care", review_headline: "Awesome Facts", rating: "3").find_or_create_by(user_name: "Tex Montreal")
farm.reviews.create_with(review_body: "Are Hiding From You", review_headline: "Secrets Spouses", rating: "4").find_or_create_by(user_name: "Molly Popper")
farm.reviews.create_with(review_body: "Incredible Microsoft Excel Tips", review_headline: "Julia Roberts's 15", rating: "5").find_or_create_by(user_name: "Emma Stout")

hobbit.reviews.create_with(review_body: "Save Gymnastics?", review_headline: "Can Steve Carell", rating: "1").find_or_create_by(user_name: "AmericaSolid")
hobbit.reviews.create_with(review_body: "Will Make Your Electrician Mad", review_headline: "Truths That", rating: "2").find_or_create_by(user_name: "Demetrius Levenworth")
hobbit.reviews.create_with(review_body: "From Former President Jimmy Carter", review_headline: "Rock Climbing Tips", rating: "3").find_or_create_by(user_name: "Ed Bed")
hobbit.reviews.create_with(review_body: "Your Bus Driver Doesn't Know About", review_headline: "Dangerous Things", rating: "5").find_or_create_by(user_name: "Stegosaurus Jones")
hobbit.reviews.create_with(review_body: "Will Make Your Professor Uncomfortable", review_headline: "Fascinating Facts That", rating: "4").find_or_create_by(user_name: "Monica Labrador")
hobbit.reviews.create_with(review_body: "Make Plastic Surgeons Feel Sexy", review_headline: "Terrifying Truths That", rating: "5").find_or_create_by(user_name: "Emma Stout")

fellowship.reviews.create_with(review_body: "Mother Isn't Telling You", review_headline: "Scary Secrets Your", rating: "1").find_or_create_by(user_name: "AmericaSolid")
fellowship.reviews.create_with(review_body: "Supervisors Won't Tell You", review_headline: "Embarrassing Things", rating: "2").find_or_create_by(user_name: "Dell MacApple")
fellowship.reviews.create_with(review_body: "PowerPoint Tips From Brad Pitt", review_headline: "Little-Known", rating: "1").find_or_create_by(user_name: "Demetrius Levenworth")
fellowship.reviews.create_with(review_body: "Baristas Are Using Against You", review_headline: "Fascinating Things", rating: "3").find_or_create_by(user_name: "Stegosaurus Jones")
fellowship.reviews.create_with(review_body: "Grandmothers Work Harder", review_headline: "Facts That Make", rating: "1").find_or_create_by(user_name: "Tex Montreal")
fellowship.reviews.create_with(review_body: "Of Joke Writing", review_headline: "The Surprising Secrets", rating: "5").find_or_create_by(user_name: "Monica Labrador")

towers.reviews.create_with(review_body: "That Will Make Your Surgeon Stronger", review_headline: "Terrible Secrets", rating: "1").find_or_create_by(user_name: "CozyLittleBookJournal")
towers.reviews.create_with(review_body: "Airline Pilot Tweets About", review_headline: "Truths Your", rating: "2").find_or_create_by(user_name: "Ronald Ward")
towers.reviews.create_with(review_body: "Collecting Tips From Robert De Niro", review_headline: " Jaw-Dropping Stamp", rating: "3").find_or_create_by(user_name: "Dell MacApple")
towers.reviews.create_with(review_body: "Employees Don't Know About", review_headline: "Incredible Things", rating: "3").find_or_create_by(user_name: "Ed Bed")
towers.reviews.create_with(review_body: "Will Make Your Local Politician Work Harder", review_headline: "Awesome Secrets That", rating: "1").find_or_create_by(user_name: "Tex Montreal")
towers.reviews.create_with(review_body: "Save Street Racing?", review_headline: "Will Leonardo DiCaprio", rating: "5").find_or_create_by(user_name: "Monica Labrador")

king.reviews.create_with(review_body: " Waiters Sleepy", review_headline: "Facts That Make", rating: "1").find_or_create_by(user_name: "Ronald Ward")
king.reviews.create_with(review_body: "Will Never Admit", review_headline: "Truths Your Grandfather", rating: "2").find_or_create_by(user_name: "AmericaSolid")
king.reviews.create_with(review_body: "From Chris Pine", review_headline: "Surprising Tree Climbing Tips", rating: "3").find_or_create_by(user_name: "Dell MacApple")
king.reviews.create_with(review_body: "That Make Lawyers Angry", review_headline: "Amazing Truths", rating: "3").find_or_create_by(user_name: "Demetrius Levenworth")
king.reviews.create_with(review_body: "Will Make Your Local Politician Nervous", review_headline: "Mind-Blowing Secrets That", rating: "2").find_or_create_by(user_name: "Ed Bed")
king.reviews.create_with(review_body: "5 Mind-Blowing Angry Birds Tips", review_headline: "Netflix CEO Reed Hastings's", rating: "5").find_or_create_by(user_name: "Stegosaurus Jones")

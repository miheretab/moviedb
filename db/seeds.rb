# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    { email: 'john@doe.com', password: 'password' },
    { email: 'user@user.com', password: 'password' },
    { email: 'someone@user.com', password: 'password' }
])
movies = Movie.create([
    { title: 'X-Men', text: 'X-Men ...', category: Movie.categories[:scientific], user:users.first },
    { title: 'Rush hour', text: 'Rush hour ...', category: Movie.categories[:action], user:users.first }
])
users.each do |user|
    next if user == users.first
    UserRating.create({ user: User.second, movie: Movie.first, rate: 3 });
    UserRating.create({ user: User.third, movie: Movie.first, rate: 4 });
end
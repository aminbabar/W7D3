# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times.each {

    user = User.new
    user.username = Faker::Internet.username
    user.password_digest = Faker::Internet.password(min_length: 10, max_length: 20)
    user.session_token = SecureRandom::urlsafe_base64(16)
    user.save
}

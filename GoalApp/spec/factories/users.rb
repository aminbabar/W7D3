FactoryBot.define do
  factory :user do
    username {Faker::Internet.username}
    password_digest {Faker::Internet.password(min_length: 10, max_length: 20)}
    session_token {SecureRandom::urlsafe_base64(16)}
  end
end

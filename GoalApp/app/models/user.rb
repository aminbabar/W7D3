class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true

    attr_reader :password
    validates :password, length: {minimum: 6, allow_nil: true}

    # run after user.new
    after_initialize :ensure_session_token


    def self.find_by_credential(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end


    #figvaper

    # celll

    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal

end

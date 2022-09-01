class User < ApplicationRecord
    # This line is required for bcrypt
    has_secure_password

    # Validating username for uniqueness, disregarding case_sensitivity
    validates :username, uniqueness: { case_sensitive: false }

    has_many :songs
end

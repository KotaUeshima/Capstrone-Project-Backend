class User < ApplicationRecord
    has_many :songs
    # This line is required for bcrypt
    has_secure_password

    # Validating username for uniqueness, disregarding case_sensitivity
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    # Validates password for length
    validates :password, presence: true, length: {minimum: 8, message: "must be at least 8 characters"}
    # Custom validation methods for number and uppercase 
    validate :contains_number
    validate :upper_case

    def contains_number
        return if password.match(/[0-9]/)
        errors.add :password, 'must contain at least one number'
    end

    def upper_case
        return if password.match(/[A-Z]/)
        errors.add :password, 'must contain at least 1 uppercase'
    end
end

class User < ApplicationRecord
    has_many :songs
    # This line is required for bcrypt
    has_secure_password

    # Validating username for uniqueness, disregarding case_sensitivity
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    # Validates password for length
    validates :password, presence: true, length: {minimum: 8, message: "must be at least 8 characters"}, if: :password_required?
    # Custom Validations
    validate :correct_email_syntax
    validate :contains_upper_case, if: :password_required?
    validate :contains_number, if: :password_required?


    def correct_email_syntax
        return if email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
        errors.add :email, 'invalid syntax'
    end

    def contains_number
        return if password.match(/[0-9]/)
        errors.add :password, 'must contain at least one number'
    end

    def contains_upper_case
        return if password.match(/[A-Z]/)
        errors.add :password, 'must contain at least 1 uppercase'
    end

    def password_required?
        false || password.present?
      end
end

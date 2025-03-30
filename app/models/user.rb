class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, format: URI::MailTo::EMAIL_REGEXP

    has_many :writings

    enum :level, [ :notSelected, :b1, :b2, :c1 ]

    # Authenticate method from doorkeeper
    def self.authenticate(email, password)
        user = User.find_for_authentication(email: email)
        user&.valid_password?(password) ? user : nil
    end
end

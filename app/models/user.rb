class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # Validate Email
    validates :email, format: URI::MailTo::EMAIL_REGEXP

    # Link writings and set to delete when user destroyed
    has_many :writings, dependent: :destroy

    # Link conversations and set to delete when user destroyed
    has_many :writing_conversations, dependent: :destroy

    # Level currently studying
    enum :level, [ :notSelected, :b1, :b2, :c1 ]

    # Authenticate method from doorkeeper
    def self.authenticate(email, password)
        user = User.find_for_authentication(email: email)
        user&.valid_password?(password) ? user : nil
    end

    # Allowing attributes to be searched by ransack
    def self.ransackable_attributes(auth_object = nil)
        [ "email", "name" ]
    end
end

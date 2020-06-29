class Bride < ActiveRecord::Base
    has_many :vendors
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :username, uniqueness: true
end
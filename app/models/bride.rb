class Bride < ActiveRecord::Base
    has_many :vendors
    has_secure_password
end
class User < ApplicationRecord

  has_secure_password :password, validations: false

end

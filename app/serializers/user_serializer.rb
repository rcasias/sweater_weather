class UserSerializer
    include FastJsonapi::ObjectSerializer
    attribute :email, :password, :password_confiramtion
end

class UsersSerializer
    include FastJsonapi::ObjectSerializer
    attribute :id, :email, :api_key
end

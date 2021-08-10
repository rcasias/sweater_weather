require 'rails_helper'

describe "Sessions" do
  it "can log in a  session" do
    user_params = {
                   email: 'email@email.com',
                   password: 'password',
                   password_confirmation: 'password'
                 }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    login = {
      email: 'email@email.com',
      password: 'password',
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(login)

    expect(response).to be_successful
  end

  it "can log in a  session - sad path wrong password" do
    user_params = {
                   email: 'email@email.com',
                   password: 'password',
                   password_confirmation: 'password'
                 }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    login = {
      email: 'email@email.com',
      password: 'passwor',
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(login)

    expect(response).to_not be_successful
  end

end

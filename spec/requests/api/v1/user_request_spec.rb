require 'rails_helper'

describe "User" do
  it "sends a list of user" do
    create_list(:user, 5)

    get '/api/v1/users'

    expect(response).to be_successful
  end

  it "can create a new user" do
    user_params = {
                   email: 'email@email.com',
                   password: 'password',
                   password_confirmation: 'password'
                 }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    expect(response).to be_successful
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.api_key.nil?).to eq(false)
  end

  it "can create a new user sad path password mis match" do
    user_params = {
                   email: 'email@email.com',
                   password: 'password',
                   password_confirmation: 'passwo'
                 }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    expect(response).to_not be_successful
  end

end

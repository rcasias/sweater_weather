require 'rails_helper'

describe "Road Trip" do
  before :each do
    @user_params = {
                   email: 'email@email.com',
                   password: 'password',
                   password_confirmation: 'password'
                 }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(@user_params)
    @created_user = User.last

    @login = {
      email: 'email@email.com',
      password: 'password',
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(@login)
  end


  it "can make a successful request" do
    user = {
              "origin": "denver,co",
              "destination": "pueblo,co",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to be_successful
  end

  it "can make a successful request and outputs correct info" do
    user = {
              "origin": "denver,co",
              "destination": "pueblo,co",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to be_successful
  end

  it "can make a successful request -sad path missing origin city" do
    user = {
              "origin": ",co",
              "destination": "pueblo,co",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to_not be_successful
  end

  it "can make a successful request -sad path missing origin state" do
    user = {
              "origin": "Denver,",
              "destination": "pueblo,co",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to_not be_successful
  end

  it "can make a successful request -sad path missing destination city" do
    user = {
              "origin": "Denver ,co",
              "destination": ",co",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to_not be_successful
  end

  it "can make a successful request -sad path missing destination state" do
    user = {
              "origin": "Denver, co",
              "destination": "pueblo,",
              "api_key": @created_user.api_key
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to_not be_successful
  end

  it "can make a successful request -sad path no api key" do
    user = {
              "origin": "Denver, co",
              "destination": "pueblo,",
              "api_key": ""
            }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(user)

    expect(response).to_not be_successful
  end


end

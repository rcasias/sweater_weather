# README

Sweater Weather is a Back End program designed to retrieve weather and images for a city as well as registration and login for a user. Once a user is registered they are given an api key. A user can then provide an origin, destination, and their api key and will be given their expected travel time and weather conditions upon arrival.

Things you may want to cover:

* Ruby and Rails versions

    ruby '2.7.2'
    rails '5.2.6'

* System configuration and dependencies

  From your terminal:

  - Run `bundle install`
  - Run  `bundle exec figaro install`
  - Verify that an `application.yml` file was created under your `config` directory.
  - In `application.yml` add your api keys

  Sweater Weather uses multiple API endpoints. You will need to register an api key at:

  - [MapQuest’s Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/) Format: `MapQuest_API_KEY: ""`
  - [OpenWeather One Call API](https://openweathermap.org/api/one-call-api) Format: `OpenWeather_API_KEY: ""`
  - [Unsplash Developers](https://unsplash.com/developers) Format: `Unsplash_API_KEY: ""`

  The final Api that was used is from Open Brewery DB, THERE ARE NO API KEYS NEEED FOR THIS DATABASE.

  - [Open Brewery DB](https://www.openbrewerydb.org/)

* Database creation

  From your terminal:

  - Run `rails db:create`

* Database initialization

  From your terminal:

  - Run `rails db:migrate`

* How to run the test suite

  From your terminal:

  - Run  `bundle exec rspec` or
  - Run `bundle exec rspec -f d` for a detailed result.

* ...

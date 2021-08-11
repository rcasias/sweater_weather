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

* Endpoints

- `GET /api/v1/forecast?location=denver,co`

```{
  "data": {
      "id": "null",
      "type": "forecast",
      "attributes": {
          "current_weather": {
              "datetime": "2021-08-10 13:53:52-0600",
              "sunrise": "2021-08-10 06:07:41-0600",
              "sunset": "2021-08-10 20:02:56-0600",
              "temp": "92.46 F",
              "feels": 88.2,
              "humidity": 15,
              "uvi": 8.73,
              "visibility": 10000,
              "description": "broken clouds",
              "icon": "04d"
          },
          "daily_weather": [
              {
                  "date": "2021-08-10",
                  "sunrise": "2021-08-10 06:07:41-0600",
                  "sunset": "2021-08-10 20:02:56-0600",
                  "max_temp": 93.27,
                  "min_temp": 71.51,
                  "conditions": "scattered clouds",
                  "icon": "03d"
              },
              {...} etc
          ],
          "hourly_weather": [
              {
                  "time": "13:00:00",
                  "temp": 92.59,
                  "conditions": "scattered clouds",
                  "icon": "03d"
              },    
              {...} etc
          ]
        }
      }
    }  
```
-  `GET /api/v1/backgrounds?location=denver,co`    

```{
  "data": {
      "id": "null",
      "type": "image",
      "attributes": {
          "image": {
              "description": "Night Time Downtown Denver",
              "url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNTIxNDF8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg2MjUxNDI&ixlib=rb-1.2.1"
          },
          "credit": {
              "source": "Unsplash.com",
              "author": "Ryan De Hamer"
          }
        }
      }
    }
```    

-  `POST /api/v1/users`

In the body of the request:

```
{
  "email": "rcasias@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Response:

```{
  "data": {
      "id": "4",
      "type": "users",
      "attributes": {
          "id": 4,
          "email": "rcasias@example.com",
          "api_key": "a939bcf8ca23432d61135d3eda22449b"
      }
  }
}
```

In the body of the request:

```
{
  "email": "rcasias@example.com",
  "password": "password"
}
```

Response:

- `POST /api/v1/sessions`

```{
  "data": {
      "id": "4",
      "type": "users",
      "attributes": {
          "id": 4,
          "email": "rcasias@example.com",
          "api_key": "a939bcf8ca23432d61135d3eda22449b"
      }
  }
}
```
- `POST /api/v1/road_trip`

In the body of the request:
```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "a939bcf8ca23432d61135d3eda22449b"
}
```

Response:

```{
  "data": {
      "id": "null",
      "type": "roadtrip",
      "attributes": {
          "start_city": "Denver, CO",
          "end_city": "Pueblo, CO",
          "travel_time": "1 hour(s), 44 minute(s)",
          "weather_at_eta": {
              "tempurature": 91.67,
              "conditions": "overcast clouds"
          }
      }
    }
  }
```  

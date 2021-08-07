require 'rails_helper'

RSpec.describe 'MapQuestService' do
  before :each do
    data = {
            "info": {
                "statuscode": 0,
                "copyright": {
                    "text": "© 2021 MapQuest, Inc.",
                    "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
                    "imageAltText": "© 2021 MapQuest, Inc."
                },
                "messages": []
            },
            "options": {
                "maxResults": -1,
                "thumbMaps": true,
                "ignoreLatLngInput": false
            },
            "results": [
                {
                    "providedLocation": {
                        "location": "Pueblo,CO"
                    },
                    "locations": [
                        {
                            "street": "",
                            "adminArea6": "",
                            "adminArea6Type": "Neighborhood",
                            "adminArea5": "Pueblo",
                            "adminArea5Type": "City",
                            "adminArea4": "Pueblo County",
                            "adminArea4Type": "County",
                            "adminArea3": "CO",
                            "adminArea3Type": "State",
                            "adminArea1": "US",
                            "adminArea1Type": "Country",
                            "postalCode": "",
                            "geocodeQualityCode": "A5XAX",
                            "geocodeQuality": "CITY",
                            "dragPoint": false,
                            "sideOfStreet": "N",
                            "linkId": "282040865",
                            "unknownInput": "",
                            "type": "s",
                            "latLng": {
                                "lat": 38.265425,
                                "lng": -104.610415
                            },
                            "displayLatLng": {
                                "lat": 38.265425,
                                "lng": -104.610415
                            },
                            "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=UegbvBv0QKyuruM2p9AjdKl5aCr5rjeR&type=map&size=225,160&locations=38.265425,-104.610415|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-1095643756"
                        },
                        {
                            "street": "",
                            "adminArea6": "",
                            "adminArea6Type": "Neighborhood",
                            "adminArea5": "",
                            "adminArea5Type": "City",
                            "adminArea4": "Pueblo County",
                            "adminArea4Type": "County",
                            "adminArea3": "CO",
                            "adminArea3Type": "State",
                            "adminArea1": "US",
                            "adminArea1Type": "Country",
                            "postalCode": "",
                            "geocodeQualityCode": "A4XAX",
                            "geocodeQuality": "COUNTY",
                            "dragPoint": false,
                            "sideOfStreet": "N",
                            "linkId": "282932014",
                            "unknownInput": "",
                            "type": "s",
                            "latLng": {
                                "lat": 38.265425,
                                "lng": -104.610415
                            },
                            "displayLatLng": {
                                "lat": 38.265425,
                                "lng": -104.610415
                            },
                            "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=UegbvBv0QKyuruM2p9AjdKl5aCr5rjeR&type=map&size=225,160&locations=38.265425,-104.610415|marker-sm-50318A-2&scalebar=true&zoom=9&rand=1498664217"
                        }
                    ]
                }
            ]
        }

    @location = MapQuest.new(data)
  end

  it 'sorts data' do
    expect(@location.lat).to eq(38.265425)
    expect(@location.lon).to eq(-104.610415)
  end

end

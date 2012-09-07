# See http://gerger.co/blog/2011/02/17/google-maps-api-v3-location-search-with-jquery-autocomplete-plugin/

# See also: https://developers.google.com/maps/documentation/javascript/places
# http://stackoverflow.com/questions/8066444/geo-autocomplete-for-a-certain-country


input = document.getElementById('user_address');
defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(42.71422,-4.222666), new google.maps.LatLng(51.179343,8.47412))
autocomplete = new google.maps.places.Autocomplete(input)
autocomplete.setBounds(defaultBounds)
autocomplete.setTypes(['geocode'])

namespace "search.gmaps"
  Geocoder: class Geocoder
    # http://www.iana.org/assignments/language-subtag-registry
    constructor: (@region = region) ->

    mapSource: (request, response) ->
      geocoder = new google.maps.Geocoder if geocoder == null
      
      geocoder.geocode
        'address': request.term

        # country/region to search!
        # http://www.iana.org/assignments/language-subtag-registry
        'region': @region 
        resultResolver

    reverseGeocode: (results) ->
      @searchLoc = results[0].geometry.location
      @lat       = results[0].geometry.location.lat
      @lng       = results[0].geometry.location.lng
      @latlng    = new google.maps.LatLng lat, lng
      @bounds    = results[0].geometry.bounds

    resultResolver: (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        reverseGeocode results
        geocoder.geocode
          'latLng': latlng
          geocodeLatLng

    geocodeLatLng: (results1, status1) ->
      if results1[1] and status1 == google.maps.GeocoderStatus.OK
        response($.map(results1, (loc) ->                            
          label  : loc.formatted_address
          value  : loc.formatted_address
          bounds : loc.geometry.bounds                          
        ))
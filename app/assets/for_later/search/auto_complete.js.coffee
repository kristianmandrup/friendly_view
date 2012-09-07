# See http://gerger.co/blog/2011/02/17/google-maps-api-v3-location-search-with-jquery-autocomplete-plugin/

# Also see http://tech.cibul.net/geocode-with-google-maps-api-v3/

namespace "search"
  AutoComplete: class AutoComplete
    constructor: (@lat = lat, @lng = lng, @zoom = 10) ->      
      @mapOptions = {
        zoom: @zoom
        mapTypeId: google.maps.MapTypeId.ROADMAP
        center: new google.maps.LatLng(@lat, @lng)
      }
      @map_elem = $('#map')
      @map = new google.maps.Map map_elem, mapOptions
      @geocoder = new google.maps.Geocoder()
      @geocoder = new gmaps.search.Geocoder 'DK'
      @self

    config: (@minLength = 2)->
      $("#searchbox").autocomplete         
        source: @geocoder.mapSource
        select: @selector
        minLength: @minLength

    # This bit is executed upon selection of an address
    selector: (event, ui) ->
      @pos = ui.item.position
      @lct = ui.item.locType
      @bounds = ui.item.bounds
      
      map.fitBounds @bounds if @bounds

      $("#latitude").val ui.item.latitude
      $("#longitude").val ui.item.longitude
      location = new google.maps.LatLng ui.item.latitude, ui.item.longitude
      marker.setPosition location
      map.setCenter location

    dragMarker: ->
      google.maps.event.addListener marker, 'drag', ->
        geocoder.geocode
          'latLng': marker.getPosition
          (results, status) ->
            if status == google.maps.GeocoderStatus.OK and results[0]
              $('#address').val results[0].formatted_address
              $('#latitude').val marker.getPosition().lat
              $('#longitude').val marker.getPosition().lng

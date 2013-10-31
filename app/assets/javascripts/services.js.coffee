jQuery ->
  if $('#map-canvas').length > 0
    google.maps.visualRefresh = true
    myLatlng = new google.maps.LatLng 10.520303, -66.904142

    mapOptions =
      center: myLatlng,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map $('#map-canvas')[0], mapOptions

    $('[data-service-latitude]').each ->
      name = $(@).attr 'data-service-name'
      lat  = $(@).attr 'data-service-latitude'
      lng  = $(@).attr 'data-service-longitude'

      if String(lat).length > 0 && String(lng).length > 0
        latLng = new google.maps.LatLng lat, lng

        marker = new google.maps.Marker
          position: latLng
          map: map,
          title: name

        $(@).click ->
          map.setCenter latLng

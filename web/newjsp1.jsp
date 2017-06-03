<html>
  <head>
    <title></title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 50%;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #origin-input,
      #destination-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 200px;
      }

      #origin-input:focus,
      #destination-input:focus {
        border-color: #4d90fe;
      }

      #mode-selector {
        color: #fff;
        background-color: #4d90fe;
        margin-left: 12px;
        padding: 5px 11px 0px 11px;
        
      }

      #mode-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
     .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    
    border: 1px solid green
}
.button1 {
     background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    
    font-size: 16px;
   
        margin-top: 10px;
    border: 1px solid green
    
}
#book{
    display:none;
}

    </style>
  </head>
  <body>
      <div id="form" style="width:100%; height:20%">
		<table align="center" valign="center">
			<tr>
				<td colspan="7" align="center"><b></b></td>
			</tr>
			<tr>
				<td colspan="7">&nbsp;</td>
			</tr>
			<tr>
				<td>Pickup Address:</td>
				<td>&nbsp;</td>
                                <td><input id="origin-input" class="controls" type="text" placeholder="Enter an origin location"></td>
				<td>&nbsp;</td>
				<td>Destination:</td>
				<td>&nbsp;</td>
                                <td><input id="destination-input" class="controls" type="text" placeholder="Enter a destination location"></td>
			</tr>
                        
                        <tr> <td>
                        <center><select id="sel" class="controls">
                                 <option value="#" >Select Vehicle Type</option>
                                 <option value="Micro" id="micro">Micro</option>
                                 <option value="Sedan" id="sedan">Sedan</option>
                                 <option value="SUV" id="suv">SUV</option>
                            </select></center>
                            </td>   
                        </tr>

                  
			<tr>
				<td colspan="7">&nbsp;</td>
			</tr>
			
		</table>
	</div>
	
	<center><div id="cost1" style="width:100%; height:10%"></div></center>
        <center><div>
                        <button id="btn" onclick="Cost();" class="button" >Estimate Cost</button>
                       
                        <a href="Success.jsp"><input type="button" id="book" class="button1" value="Book Now"></a>
                        
            </div></center>
	<center><div id="map" style="width:70%; height:55%"></div></center>
       <script>
      
     var d;
     
     
     function showPosition(position) {
  var lat = position.coords.latitude;
  var lng = position.coords.longitude;
  map.setCenter(new google.maps.LatLng(lat, lng));
         }
      function initMap() {
        var origin_place_id = null;
        var destination_place_id = null;
        var travel_mode = 'DRIVING';
        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeControl: true,
          center: {lat: 28.7186211, lng: 77.0685134}, 
          zoom: 13
          
        });
        if (navigator.geolocation) {
         navigator.geolocation.getCurrentPosition(function (position) {
             initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
             map.setCenter(initialLocation);
             });
         }
        ;
        
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        directionsDisplay.setMap(map);

        var origin_input = document.getElementById('origin-input');
        var destination_input = document.getElementById('destination-input');
        
        
        
        var origin_autocomplete = new google.maps.places.Autocomplete(origin_input);
        origin_autocomplete.bindTo('bounds', map);
        var destination_autocomplete =
            new google.maps.places.Autocomplete(destination_input);
        destination_autocomplete.bindTo('bounds', map);

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        

        function expandViewportToFitPlace(map, place) {
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }
        }

        origin_autocomplete.addListener('place_changed', function() {
          var place = origin_autocomplete.getPlace();
          if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
          }
          expandViewportToFitPlace(map, place);

          // If the place has a geometry, store its place ID and route if we have
          // the other place ID
          origin_place_id = place.place_id;
          route(origin_place_id, destination_place_id, travel_mode,
                directionsService, directionsDisplay);
        });

        destination_autocomplete.addListener('place_changed', function() {
          var place = destination_autocomplete.getPlace();
          if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
          }
          expandViewportToFitPlace(map, place);

          // If the place has a geometry, store its place ID and route if we have
          // the other place ID
          destination_place_id = place.place_id;
          route(origin_place_id, destination_place_id, travel_mode,
                directionsService, directionsDisplay);
        });

        function route(origin_place_id, destination_place_id, travel_mode,
                       directionsService, directionsDisplay) {
          if (!origin_place_id || !destination_place_id) {
            return;
          }
          directionsService.route({
            origin: {'placeId': origin_place_id},
            destination: {'placeId': destination_place_id},
            travelMode: travel_mode
          }, function(response, status) {
            if (status === 'OK') {
              directionsDisplay.setDirections(response);
              d=response.routes[0].legs[0].distance.text;
              time=response.routes[0].legs[0].duration.text;
              
              q=parseInt(d);            
                                
            } else {
              window.alert('Directions request failed due to ' + status);
            }
          });
        }
        
      }
      function Cost()
        {  
            var e = document.getElementById("sel");
            var strUser = e.options[e.selectedIndex].value;
            
            if(strUser==="Micro")
            {
                var cost=25+q*3;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: "+cost; 
              document.getElementById("book").style.display="block";
                        
                      
            }
            if(strUser==="Sedan")
            {
                var cost=35+q*5;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: "+cost;  
              document.getElementById("book").style.display="block";
            }
            if(strUser==="SUV")
            {
                var cost=50+q*10;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: Rs. "+cost;  
              document.getElementById("book").style.display="block";
            }
             
        }
        
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM_R1n2DIt9tHWy3J-Z6HIjBF2FX2lR6I&libraries=places&callback=initMap"
        async defer></script>
        </body>
</html>
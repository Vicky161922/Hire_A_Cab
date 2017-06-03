<html>
<head>
<title>Booking</title>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCM_R1n2DIt9tHWy3J-Z6HIjBF2FX2lR6I&libraries=places&callback=initAutocomplete"></script>
<script type="text/javascript">

	var location1;
	var location2;
	
	var address1;
	var address2;

	var latlng;
	var geocoder;
	var map;
	var d;
	var distance;
        
	
      

    
	// finds the coordinates for the two locations and calls the showMap() function
	function initialize()
	{
		geocoder = new google.maps.Geocoder(); // creating a new geocode object
		
		// getting the two address values
		address1 = document.getElementById("address1").value;
		address2 = document.getElementById("address2").value;
		
		// finding out the coordinates
		if (geocoder) 
		{
			geocoder.geocode( { 'address': address1}, function(results, status) 
			{
				if (status == google.maps.GeocoderStatus.OK) 
				{
					//location of first address (latitude + longitude)
					location1 = results[0].geometry.location;
				} else 
				{
					alert("Geocode was not successful for the following reason: " + status);
				}
			});
			geocoder.geocode( { 'address': address2}, function(results, status) 
			{
				if (status == google.maps.GeocoderStatus.OK) 
				{
					//location of second address (latitude + longitude)
					location2 = results[0].geometry.location;
					// calling the showMap() function to create and show the map 
					showMap();
                                        initAutocomplete();
				} else 
				{
					alert("Geocode was not successful for the following reason: " + status);
				}
			});
		}
                
	}
		
	// creates and shows the map
	function showMap()
	{
		// center of the map (compute the mean value between the two locations)
		latlng = new google.maps.LatLng((location1.lat()+location2.lat())/2,(location1.lng()+location2.lng())/2);
		
		// set map options
			// set zoom level
			// set center
			// map type
		var mapOptions = 
		{
			zoom: 1,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.HYBRID
		};
		
		// create a new map object
			// set the div id where it will be shown
			// set the map options
		map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		
		// show route between the points
		directionsService = new google.maps.DirectionsService();
		directionsDisplay = new google.maps.DirectionsRenderer(
		{
			suppressMarkers: true,
			suppressInfoWindows: true
		});
		directionsDisplay.setMap(map);
		var request = {
			origin:location1, 
			destination:location2,
			travelMode: google.maps.DirectionsTravelMode.DRIVING
		};
                
		directionsService.route(request, function(response, status) 
		{
			if (status == google.maps.DirectionsStatus.OK) 
			{
				directionsDisplay.setDirections(response);
				distance = "The distance between the two points on the chosen route is: "+response.routes[0].legs[0].distance.text;
				distance += "<br/>The aproximative driving time is: "+response.routes[0].legs[0].duration.text;
				document.getElementById("distance_road").innerHTML = distance;
			}
                        
		});
                
		
		// show a line between the two points
		var line = new google.maps.Polyline({
			map: map, 
			path: [location1, location2],
			strokeWeight: 7,
			strokeOpacity: 0.8,
			strokeColor: "#FFAA00"
		});
		
		// create the markers for the two locations		
		var marker1 = new google.maps.Marker({
			map: map, 
			position: location1,
			title: "First location"
		});
		var marker2 = new google.maps.Marker({
			map: map, 
			position: location2,
			title: "Second location"
		});
		
		// create the text to be shown in the infowindows
		var text1 = '<div id="content">'+
				'<h1 id="firstHeading"></h1>'+
				'<div id="bodyContent">'+
				'<p></p>'+
				'<p>Address: '+address1+'</p>'+
				'</div>'+
				'</div>';
				
		var text2 = '<div id="content">'+
			'<h1 id="firstHeading">Second location</h1>'+
			'<div id="bodyContent">'+
			'<p>Coordinates: '+location2+'</p>'+
			'<p>Address: '+address2+'</p>'+
			'</div>'+
			'</div>';
		
		// create info boxes for the two markers
		var infowindow1 = new google.maps.InfoWindow({
			content: text1
		});
		var infowindow2 = new google.maps.InfoWindow({
			content: text2
		});

		// add action events so the info windows will be shown when the marker is clicked
		google.maps.event.addListener(marker1, 'click', function() {
			infowindow1.open(map,marker1);
		});
		google.maps.event.addListener(marker2, 'click', function() {
			infowindow2.open(map,marker1);
		});
		
		// compute distance between the two points
		var R = 6371; 
		var dLat = toRad(location2.lat()-location1.lat());
		var dLon = toRad(location2.lng()-location1.lng()); 
		
		var dLat1 = toRad(location1.lat());
		var dLat2 = toRad(location2.lat());
		
		var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
				Math.cos(dLat1) * Math.cos(dLat1) * 
				Math.sin(dLon/2) * Math.sin(dLon/2); 
		var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		 d = R * c;
		 d= Math.round(d * 100)/100;
		
                Cost();
    }
	
	function toRad(deg) 
	{
		return deg * Math.PI/180;
	}
        function Cost()
        {
            var e = document.getElementById("sel");
            var strUser = e.options[e.selectedIndex].value;
            if(strUser==="Micro")
            {
                var cost=d*3;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: "+cost;  
            }
            if(strUser==="Sedan")
            {
                var cost=d*5;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: "+cost;  
            }
            if(strUser==="SUV")
            {
                var cost=d*10;
                cost= Math.round(cost * 100)/100;
              document.getElementById("cost1").innerHTML = "<br/>Estimated Cost is: Rs. "+cost;  
            }
        }
</script>

</head>

<body bgcolor="#eeeeee">
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
                                <td><input type="text" name="address1" id="address1" size="50" placeholder="Pickup Address"/></td>
				<td>&nbsp;</td>
				<td>Destination:</td>
				<td>&nbsp;</td>
                                <td><input type="text" name="address2" id="address2" size="50" placeholder="Destination"/></td>
			</tr>
                        
                        <tr>
                            <td align="center">
                                <select id="sel">
                                 <option value="#" >Select Vehicle Type</option>
                                 <option value="Micro" id="micro">Micro</option>
                                 <option value="Sedan" id="sedan">Sedan</option>
                                 <option value="SUV" id="suv">SUV</option>
                                </select>
                            </td>
                        </tr>

                        
			<tr>
				<td colspan="7">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="7" align="center"><input type="button" value="Show" onclick="initialize();"/></td>
			</tr>
		</table>
	</div>
	<center><div style="width:100%; height:10%" id="distance_road"></div></center>
	<center><div id="cost1" style="width:100%; height:10%"></div></center>
        <center><div id="booking" >
                <input type="button" onclick="" ></div></center>  
	<center><div id="map_canvas" style="width:70%; height:54%"></div></center>
              
</body>
</html>
<%@ page language="java" contentType="text/html"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="plain/text; charset=ISO-8859-1">
<title>Google Maps Multiple Markers</title>
<script src="http://maps.google.com/maps/api/js?sensor=false"
	type="text/javascript"></script>
<script type="text/javascript">
	
	
	var val = "";
	var url = "yoPage.jsp";
	var array="";
	var marker;
	var loc, latitude, longitude;
	var locSON="d";
	var locations;
	var i;
	var myStr="";
	var geocoder = new google.maps.Geocoder();


	
	function request()
	{
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
		return;
	}
		

		function getInfo() {	
			if (request.readyState == 4) {
				val = request.responseText;
				console.log(val);
				array = val.split(':');
				console.log(array);
				alert(array);
				loop();
			}
			return;
		}
	
	
		function loop(){
			
			for (i = 0; i < array.length-1; i++) {
				//loc=array[i];
				alert("Calling: "+array[i]+" "+i);
				latLngi(array[i]);
			}
			//var get=locSON;
			//alert(get);
			alert(locSON+" in loop.");
			mark();	
			return;
		}
		
		
		
		function latLngi(local)
		{
			alert("Inside Lungi: " + local);
			geocoder.geocode({'address': local},onGeoCodeSuccess);
			alert("Exit Lungi: "+locSON);
			return;
		}
		
		function onGeoCodeSuccess(results, status) {
			//alert(status);
			//alert(results);
			if (status == google.maps.GeocoderStatus.OK) {
				latitude = results[0].geometry.location.lat();
				longitude = results[0].geometry.location.lng();
				locSON=locSON+'["latitude":'+latitude+',"longitude":'+longitude+'],';
				alert(locSON + "if condition");
				myStr = "Eshu";
				//alert(locSON);
			}
			//console.log("inside latLngi" + myStr);
			alert(locSON+"outside");
			return;
		}
			
		function mark()
		{
			var locSON1='['+locSON+']';
			alert("inside locSON");
			//locations = JSON.parse(locSON1);
			var locations = [
			  ['Bondi Beach', -33.890542, 151.274856, 4],
			  ['Coogee Beach', -33.923036, 151.259052, 5],
			  ['Cronulla Beach', -34.028249, 151.157507, 3],
			  ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
			  ['Maroubra Beach', -33.950198, 151.259302, 1]
			];
			console.log(locations);
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : new google.maps.LatLng(13.08, 80.27),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			});
			
			
			for ( i = 0; i < locations.length; i++) {
				marker = new google.maps.Marker({
				position : new google.maps.LatLng(locations[i][1],locations[i][2]),
				map : map
				
				});

				 google.maps.event
						.addListener(marker,'click',function(map) {
							this.setIcon('https://www.google.com/mapfiles/marker_green.png');
									getAddress(map.latLng);

								}); 
			}
			return;
		}
	
		/*var locations = [
		  ['Bondi Beach', -33.890542, 151.274856, 4],
		  ['Coogee Beach', -33.923036, 151.259052, 5],
		  ['Cronulla Beach', -34.028249, 151.157507, 3],
		  ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
		  ['Maroubra Beach', -33.950198, 151.259302, 1]
		];*/

		function getAddress(latLng) {
			geocoder.geocode(
					{
						'latLng' : latLng
					},
					function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							if (results[0]) {
								var outString ="Open.jsp?x1=" + 10;
									window.open(outString,'winname','directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=350');
									//document.getElementById("address").value = results[0].formatted_address;
							}

						}
					});
		}

	</script>
</head>
<body onLoad="request()">
	<div id="map" style="width: 1000px; height: 650px; float: center;"></div>
</body>
</html>
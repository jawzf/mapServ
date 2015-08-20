<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false"></script>
    <script type="text/javascript">
   
    var map,i;
        
        function initialize() { var myOptions = { 
        		center: new google.maps.LatLng(-33.92, 151.25), zoom: 8, mapTypeId: google.maps.MapTypeId.ROADMAP };

            geocoder = new google.maps.Geocoder();
            var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
            
            google.maps.event.addListener(map, 'click', function(event) {
            	 getAddress(event.latLng);
            	//placeMarker(event.latLng);
            });  

           /*  var marker;
            function placeMarker(location) {
                if(marker){ //on vérifie si le marqueur existe
                    marker.setPosition(location); //on change sa position
                }else{
                    marker = new google.maps.Marker({ //on créé le marqueur
                        position: location, 
                        map: map
                    });
                }
                getAddress(location);
            } */

      function getAddress(latLng) {
        geocoder.geocode( {'latLng': latLng},
          function(results, status) {
            if(status == google.maps.GeocoderStatus.OK) {
              if(results[0]) {
                document.getElementById("address").value = results[0].formatted_address;

              }
              else {
                document.getElementById("address").value = "No results";
              }
            }
            else {
              document.getElementById("address").value = status;
            }
          });
        }
      } 
        
       /*  var infowindow = new google.maps.InfoWindow();
        for (i = 0; i < locations.length; i++) {  
          marker = new google.maps.Marker({
              position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              map: map
            });

          google.maps.event.addListener(marker, 'click', function(event) {
         	 getAddress(event.latLng);
            
          } */
        
     google.maps.event.addDomListener(window, 'load', initialize);
    </script>
      </head>
<body bgcolor="cyan">
<form name="myForm" method="post" action="insert.jsp"  onsubmit="return validateForm()">

<div style="background-image:url(bg.jpg); ">
<center><h1><font color="red">TRAFFIC INFORMATION SYSTEM</font></h1></center><br>
</div>
<hr size="10" color="red">

<div>

</div>
<div id="content" style="width:1200px;">
   <div id="map_canvas" style="width:750px; height: 450px; float:left;"></div>
    <div style="width:400px; height: 500px; float:right; margin-top: 100px;" >
<table  cellpadding="8">
<tr>
<td align="left">
Location</td><td>   <textarea rows="4" cols="20" id="address" name="location"></textarea></td>


<tr><td><input type="hidden"></td><td><input type="hidden"></td>
<td><input type="image" src="submit.gif" alt="Submit" width="48" height="48"/></td></tr>
</table>
</div>
<div>

</div>
</div>
</form>
</body>
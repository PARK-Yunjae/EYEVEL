<html>
  <head>
    <title>Street View split-map-panes</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

	<style>
	html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

#map,
#pano {
  float: left;
  height: 100%;
  width: 50%;
}
	
	</style>
    <script type="module" src="./street.js"></script>
  </head>
  <body>
    <div id="map"></div>
    <div id="pano"></div>

    <!--
      The `defer` attribute causes the callback to execute after the full HTML
      document has been parsed. For non-blocking uses, avoiding race conditions,
      and consistent behavior across browsers, consider loading using Promises.
      See https://developers.google.com/maps/documentation/javascript/load-maps-js-api
      for more information.
      -->
	    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y&callback=initialize&v=weekly"
      defer
    ></script>
  </body>
</html>
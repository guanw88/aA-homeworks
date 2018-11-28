console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!")
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});

console.log("Goodbye!")

// When does the request get sent?
// Request is sent during the initial page load.

// When does the response come back?
// Response comes back after the page has finished loading.

// What's the current weather in New York?
// Console logged the following info:
// base: "stations"
// clouds: {all: 40}
// cod: 200
// coord: {lon: -73.99, lat: 40.73}
// dt: 1543382100
// id: 5128581
// main: {temp: 275.72, pressure: 998, humidity: 67, temp_min: 274.85, temp_max: 276.45}
// name: "New York"
// sys: {type: 1, id: 4610, message: 0.0049, country: "US", sunrise: 1543406267, …}
// visibility: 16093
// weather: [{…}]
// wind: {speed: 5.1, deg: 270, gust: 9.3}

// Did the page refresh?
// No. The page did not refresh.

// How could we use different HTTP methods in our request?
// We can adjust the type variable in the top (e.g. to POST).

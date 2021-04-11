// TODO: Write your JS code in here
// API Key -
import $ from 'jquery';
import 'select2';
import { getDate } from "./date";
import { getWeather } from "./cityWeather";
import { getLocalWeather } from "./localWeather";
// $('#city-input').select2();
const cities = ["Amsterdam", "Bali", "Barcelona", "Belo Horizonte", "Berlin", "Bordeaux", "Brussels", "Buenos Aires", "Casablanca", "Chengdu", "Copenhagen", "Kyoto", "Lausanne", "Lille", "Lisbon", "London", "Lyon", "Madrid", "Marseille", "Melbourne", "Mexico", "Milan", "Montréal", "Nantes", "Oslo", "Paris", "Rio de Janeiro", "Rennes", "Rome", "São Paulo", "Seoul", "Shanghai", "Shenzhen", "Singapore", "Stockholm", "Tel Aviv", "Tokyo"];
$('#city-name').select2({ data: cities, width: '100%' });
const form = document.getElementById('weather-form');
const cityName = document.getElementById("city-name");
const weatherResults = document.getElementById("weather-result");
const resultList = document.getElementById("result-list");
const currentLocation = document.getElementById("current-location");
// const getDegreeCent = (temp) => {
//   return Math.round(temp);
// };
// getWeather("London");
form.addEventListener("submit", (event) => {
  resultList.innerHTML = "";
  event.preventDefault();
  getWeather(cityName.value);
});
currentLocation.addEventListener("click", (event) => {
  resultList.innerHTML = "";
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    getLocalWeather(data.coords.latitude, data.coords.longitude);
  });
});

import { getDate } from "./date";

const resultList = document.getElementById("result-list");
const getLocalWeather = (lat, lon) => {
  fetch(`https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&units=metric&appid=fced21b198cdc282766ceae64070ad7f`)
    .then(response => response.json())
    .then((data) => {
      resultList.insertAdjacentHTML("beforeend", `<h1>Weather in your city</h1>`);
      resultList.insertAdjacentHTML("beforeend", `<h2>${getDate(data.timezone_offset)}</h1>`);
      resultList.insertAdjacentHTML("beforeend", `<h6>${data.current.weather[0].main}</h6>`);
      resultList.insertAdjacentHTML("beforeend", `<div class="f-row"><img src="http://openweathermap.org/img/wn/${data.current.weather[0].icon}@2x.png"> <h2>${Math.round(data.current.temp)}°C</h2></div>`);
    });
};
export { getLocalWeather };

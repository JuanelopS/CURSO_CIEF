window.onload = () => {

  // http://api.openweathermap.org/geo/1.0/reverse?lat={lat}&lon={lon}&limit={limit}&appid={API key}
  
  // http://api.openweathermap.org/geo/1.0/direct?q=London&limit=1&appid={API key}

  // http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=${apiKey}`;

  const weather_api = async (city, country) => {

    const apiKey = "37aca18cb7ee6ee37d11b26aab4eb6de";
    let url = `http://api.openweathermap.org/data/2.5/weather?q=${city},${country}&APPID=${apiKey}&units=metric`;
    const data = await fetch(url);
    return await data.json();
  }

  /* HTML Geolocation API */

  const getLocation = () => {
    navigator.geolocation 
    ? navigator.geolocation.getCurrentPosition(showPosition)
    : alert("Geolocalización no soportada o sin autorización");
  }

  const showPosition = position => {
    console.log(position.coords.latitude, position.coords.longitude);
  }

  // getLocation();

  const submitBtn = document.querySelector('input[type=submit]');


  submitBtn.addEventListener('click', e => {

    e.preventDefault();

    const city = document.querySelector('input[name=city]').value;
    const country = document.querySelector('input[name=countrycode]').value;

    const place = document.querySelector('.place-text');
    const weather = document.querySelector('.weather-text');
    const temp = document.querySelector('.temp-text');
    const humidity = document.querySelector('.humidity-text');
    const wind = document.querySelector('.wind-text');

    weather_api(city, country)
      .then( response => {
        console.log(response);
        place.textContent = `${city} / ${country.toUpperCase()}`;
        weather.textContent = `${response.weather[0].main}`;
        temp.textContent = `${response.main.temp.toFixed(1)}`;
        humidity.textContent = `${response.main.humidity} %`
        wind.textContent = `${response.wind.speed} m/s`

      });

  });


}
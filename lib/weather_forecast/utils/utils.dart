String weatherBaseUrl(String endpoint, String city, String apiKey,
    {String unit = 'metric'}) {
  return 'http://api.openweathermap.org/data/2.5/$endpoint?units=$unit&q=$city&appid=$apiKey';
}

const apiKey = 'a5048a96bc9960c6799fb0d18d242aff';

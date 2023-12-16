import '../services/network.dart';
import 'package:geolocator/geolocator.dart';

// Function to get weather data for a city
Future<dynamic> getCityWeather({
  String? cityName,
  String? latitude,
  String? longitude,
}) async {
  try {
    if (cityName != null) {
      final String weatherUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=3ae1f8eccc81ba3b9e1bba103aa12fe7&units=metric";

      NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
      var weatherData = await networkHelper.getData();
      return weatherData;
    } else if (latitude != null && longitude != null) {
      Position position = await Geolocator.getCurrentPosition();
      double latitude = position.latitude;
      double longitude = position.longitude;

      final String weatherUrl =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=3ae1f8eccc81ba3b9e1bba103aa12fe7&units=metric";

      NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
      var weatherData = await networkHelper.getData();
      return weatherData;
    } else {
      return null;
    }
  } catch(error){
    print("Error in getCityWeather: $error");
    return null;
  }
}
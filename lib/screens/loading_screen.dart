import 'package:flutter/material.dart';
import '../services/network.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/city_call.dart';
import '../services/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    var weatherData = await getCityWeather(
      cityName: null,
      latitude: location.latitude.toString(),
      longitude: location.longitude.toString(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  // //method to get city weather
  // Future<dynamic> getCityWeather(String cityName) async {
  //   final String weatherUrl =
  //       "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=3ae1f8eccc81ba3b9e1bba103aa12fe7&units=metric";
  //   // "https://api.openweathermap.org/data/2.5/weather?lat=88&lon=88&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
  //   NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
  //
  //   var weatherData = await networkHelper.getData();
  //   return weatherData;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.09),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

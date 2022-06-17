import 'dart:math';

import 'hourly_forecast_model.dart';
import 'network-util.dart';
import 'location.dart';
import 'error-handler.dart';

/// Constants for the API URL and Key
const apiBaseURL = "https://api.openweathermap.org/data/2.5";
const weatherApiKey = "2205e462407e84d8167d04a4872dead9";
const baseTimeApiURL =
    "https://timezone.abstractapi.com/v1/current_time/?api_key=6de43a8244544ffca5df7a103d0e1d95";
const apiHourly =
    "onecall?lat=6.5&lon=3.4&exclude=current,alerts,minutely,daily&appid=$weatherApiKey&units=metric";

NetworkHelper _networkHelper = NetworkHelper();
ErrorHandler _errorHandler = ErrorHandler();

class WeatherData {
  double? deviceLat;
  double? deviceLong;

  /// Method to get the get the Current location of the User
  Future<dynamic> getCurrentWeatherData() async {
    LocationHelper _locationHelper = LocationHelper();

    try {
      await _locationHelper.getLocation();
      deviceLat = _locationHelper.lat;
      deviceLong = _locationHelper.long;

      final apiLatAndLongURL =
          "weather?lat=$deviceLat&lon=$deviceLong&appid=$weatherApiKey&units=metric";
      var getData = await _networkHelper.get("$apiBaseURL/$apiLatAndLongURL");
      return getData;
    } catch (e) {
      print(e);
    }
  }

  /// Method to get the location of a City by City Name
  Future<dynamic> getCityWeatherData(String? cityName) async {
    try {
      final apiCityURL =
          "weather?q=$cityName&appid=$weatherApiKey&units=metric";
      var getCityData = await _networkHelper.get('$apiBaseURL/$apiCityURL');
      return getCityData;
    } catch (e) {
      print(e);
    }
  }

  /// Method to get the Time of the City
  Future<dynamic> getCityTime(String? cityLocation) async {
    try {
      final timeCityURL = "location=$cityLocation";
      var getTimeCityData =
          await _networkHelper.get('$baseTimeApiURL&$timeCityURL');
      return getTimeCityData;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Hourly>> getHourlyWeather() async {
    List<Hourly> hourlyModel = [];
    try {
      await _networkHelper.get("$apiBaseURL/$apiHourly").then((value) {
        var res = value['hourly'] as List;
        //print(res);
        hourlyModel = List<Hourly>.from(res.map((x) => Hourly.fromJson(x)).toList());
            /*res.map<Hourly>((json) => Hourly.fromJson(json)).toList();*/
        /*res.map<Hourly>.from(res.map((x) => Hourly.fromJson(x)))*/;
        print(hourlyModel);
      }).catchError((e) {
        //print(e);
        _errorHandler.handleError(e);
      });
    } catch (e) {
      print(" The Try Error is $e");
    }
    return hourlyModel;
  }
}

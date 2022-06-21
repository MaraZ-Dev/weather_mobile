import 'hourly_forecast_model.dart';
import 'network-util.dart';
import 'location.dart';
import 'error-handler.dart';
import 'daily_forecast_model.dart';

/// Constants for the API URL and Key
const apiBaseURL = "https://api.openweathermap.org/data/2.5";
const weatherApiKey = "2205e462407e84d8167d04a4872dead9";
const baseTimeApiURL =
    "https://timezone.abstractapi.com/v1/current_time/?api_key=6de43a8244544ffca5df7a103d0e1d95";
const apiHourly =
    "&exclude=current,alerts,minutely,daily&appid=$weatherApiKey&units=metric";
const apiDaily = "&exclude=current,alerts,minutely,hourly&appid=$weatherApiKey&units=metric";

NetworkHelper _networkHelper = NetworkHelper();
ErrorHandler _errorHandler = ErrorHandler();
LocationHelper _locationHelper = LocationHelper();

class WeatherData {
  double? deviceLat;
  double? deviceLong;

  /// Method to get the get the Current location of the User
  Future<dynamic> getCurrentWeatherData() async {
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

  /// Method to get the Hourly Forecast Weather Data
  Future<List<Hourly>> getHourlyWeather() async {
    List<Hourly> hourlyModel = [];
    try {
      await _locationHelper.getLocation();
      deviceLat = _locationHelper.lat;
      deviceLong = _locationHelper.long;

      await _networkHelper
          .get(
              "$apiBaseURL/onecall?lat=$deviceLat&lon=$deviceLong$apiHourly")
          .then((value) {
        var res = value['hourly'] as List;
        hourlyModel =
            List<Hourly>.from(res.map((x) => Hourly.fromJson(x)).toList());
      }).catchError((e) {
        //print(e);
        _errorHandler.handleError(e);
      });
    } catch (e) {
      print(" The Try Error is $e");
    }
    return hourlyModel;
  }

  /// Method to get the Daily Forecast Weather Data
  Future<List<Daily>> getDailyWeather() async {
    List<Daily> dailyModel = [];
    try {
      await _locationHelper.getLocation();
      deviceLat = _locationHelper.lat;
      deviceLong = _locationHelper.long;

      await _networkHelper
          .get(
          "$apiBaseURL/onecall?lat=$deviceLat&lon=$deviceLong$apiDaily")
          .then((value) {
        var res = value['daily'] as List;
        //print(res);
        dailyModel =
        List<Daily>.from(res.map((x) => Daily.fromJson(x)).toList());
      }).catchError((e) {
        //print(e);
        _errorHandler.handleError(e);
      });
    } catch (e) {
      print(" The Try Error is $e");
    }
    return dailyModel;
  }

  /// Method to get the Weather Icon using the Weather ID in the API response
  String getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return 'images/thunderstorm.png';
    } else if (code >= 300 && code < 400) {
      return 'images/shower_rain.png';
    } else if (code >= 500 && code < 600) {
      return 'images/rain.png';
    } else if (code >= 600 && code < 700) {
      return 'images/winter.png';
    } else if (code > 800 && code < 900) {
      return 'images/few_clouds.png';
    } else if (code == 800) {
      return 'images/sun.png';
    } else {
      return 'images/full_sun.png';
    }
  }
}

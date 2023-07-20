import 'Location.dart';
import 'Networking.dart';

// ignore: constant_identifier_names
const KApiKey = "c930b4389dd29ed1959cb507adc83227";

class Weather {
  Future<Map<String, dynamic>> locationData() async {
    Location location = Location();
    await location.getLocation();
    double? l1 = location.latitude;
    double? l2 = location.longitude;
    print(l1);
    print(l2);
    Networking networking = Networking(
        "https://api.openweathermap.org/data/2.5/weather?lat=$l1&lon=$l2&appid=$KApiKey&units=metric");
    Map<String, dynamic> responseBody = await networking.network();
    return responseBody;
  }

  Future<Map<String, dynamic>> cityData(String cityName) async {
    Networking networking2 = Networking(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$KApiKey&units=metric');
    Map<String, dynamic> responseBody2 = await networking2.network();
    return responseBody2;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

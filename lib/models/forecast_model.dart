import 'package:weatherapp/models/main_model.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/models/wind_model.dart';

class ForecastModel {
  String? dt;
  MainOwmModel? main;
  WeatherModel? weather;
  int? clouds;
  WindModel? wind;
  String? dt_txt;

  ForecastModel(
      {this.dt, this.main, this.weather, this.clouds, this.wind, this.dt_txt});

  ForecastModel.fromJson(data) {
    dt = data['dt'].toString();
    main = MainOwmModel(
        temp: data['main']['temp'],
        pressure: data['main']['pressure'],
        humidity: data['main']['humidity']);
    weather = WeatherModel(
        id: data['weather'][0]['id'],
        main: data['weather'][0]['main'],
        description: data['weather'][0]['description'],
        icon: data['weather'][0]['icon']);
    clouds = data['clouds']['all'];
    wind = WindModel(
        speed: data['wind']['speed'],
        deg: data['wind']['deg'],
        gust: data['wind']['gust']);
    dt_txt = data['dt_txt'];
  }
}

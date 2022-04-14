import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/forecast_list_model.dart';

class Service {
//   Future<ForecastListModel> getForecastList() async {
//     final jsonData = await rootBundle.rootBundle
//         .loadString('assets/json/forecast_sumedang.json');
//
//     final data = ForecastListModel.fromJson(json.decode(jsonData));
//
//     return data;
//   }

  Future<ForecastListModel?> getForecastList(city) async {
    try {
      var apiKey = 'c31fe12c766c1160a9cbb58dc8c2c6f7';
      var baseUrl =
          'http://api.openweathermap.org/data/2.5/forecast?q=$city,Id&units=Metric&appid=$apiKey';
      var url = Uri.parse(baseUrl);

      var response = await http.get(url).timeout(const Duration(seconds: 10),
          onTimeout: () {
        throw TimeoutException("Connection timeout, try again");
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return ForecastListModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } on TimeoutException catch (e) {
      print("Response timeout, Error message: ${e.message}");
    }
  }
}

class ForecastListModel {
  String? cod;
  int? cnt;
  List<dynamic>? forecastList;
  Map<String, dynamic>? city;

  ForecastListModel({this.cod, this.cnt, this.forecastList, this.city});

  ForecastListModel.fromJson(json) {
    cod = json['cod'];
    cnt = json['cnt'];
    forecastList = json['list'];
    city = json['city'];
  }
}

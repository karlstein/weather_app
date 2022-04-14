import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast_model.dart';

class ForecastContainer extends StatelessWidget {
  const ForecastContainer({required this.dummyForecast, Key? key})
      : super(key: key);

  final List<ForecastModel> dummyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 270,
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dummyForecast.length,
        itemBuilder: (context, index) {
          if (dummyForecast.length == 0 || dummyForecast.length == null)
            return Text("Data tidak ada");

          return Column(
            children: [
              Text(
                "${dummyForecast[index].dt_txt!.substring(11, 16)}",
                style: TextStyle(color: Colors.white),
              ),
              Image.network(
                  "http://openweathermap.org/img/wn/${dummyForecast[index].weather!.icon}.png"),
              Text("${dummyForecast[index].main!.temp} \u2103",
                  style: TextStyle(color: Colors.white)),
            ],
          );
        },
      ),
    );
  }
}

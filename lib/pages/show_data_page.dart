import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/controllers/app_controller.dart';
import 'package:weatherapp/models/daytime_div.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff75d7fc),
        centerTitle: true,
        title: Column(
          children: [
            Text("${c.kota}",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            Text("${DateFormat('EEEE, MMM d, yyyy').format(DateTime.now())}",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Container(
              color: Color(0xff75d7fc),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Selamat ${timeDivision.firstWhere((e) => c.today.value!.isAfter(e.rangeTimeDiv!.start) && c.today.value!.isBefore(e.rangeTimeDiv!.end)).timeDiv}, ${c.username.split(" ").first}",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                Text(
                                  "${c.currentForecast.value!.main!.temp} \u2103",
                                  style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                    "${c.currentForecast.value!.weather!.description}",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white)),
                                Image.network(
                                    "http://openweathermap.org/img/wn/${c.currentForecast.value!.weather!.icon}@2x.png"),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(135, 158, 202, 0.6),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    BoxedIcon(
                                      WeatherIcons.humidity,
                                      color: Colors.white,
                                    ),
                                    Text(
                                        "${c.currentForecast.value!.main!.humidity} %",
                                        style: TextStyle(color: Colors.white)),
                                    Text("Humidity",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    BoxedIcon(
                                      WeatherIcons.time_1,
                                      color: Colors.white,
                                    ),
                                    Text(
                                        "${c.currentForecast.value!.main!.pressure} hpa",
                                        style: TextStyle(color: Colors.white)),
                                    Text("Pressure",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    BoxedIcon(
                                      WeatherIcons.cloud,
                                      color: Colors.white,
                                    ),
                                    Text("${c.currentForecast.value!.clouds} %",
                                        style: TextStyle(color: Colors.white)),
                                    Text("Cloudiness",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    BoxedIcon(
                                      WeatherIcons.wind,
                                      color: Colors.white,
                                    ),
                                    Text(
                                        "${c.currentForecast.value!.wind!.speed} %",
                                        style: TextStyle(color: Colors.white)),
                                    Text("Wind",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(135, 158, 202, 0.6),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: c.dayColumnList(c.perDayForecast.value),
                        ),
                        Container(
                          child: Column(
                            children: c.contentListviewList(
                                c.dataForecastList, c.perDayForecast.value),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/models/city_model.dart';
import 'package:weatherapp/models/daytime_div.dart';
import 'package:weatherapp/models/forecast_model.dart';
import 'package:weatherapp/routes/routes_name.dart';
import 'package:weatherapp/services/firebase.dart';
import 'package:weatherapp/services/service.dart';
import 'package:weatherapp/widgets/day_group_container.dart';
import 'package:weatherapp/widgets/forecast_container.dart';

class AppController extends GetxController {
  Service service = Service();
  FirebaseInstance firebase = FirebaseInstance();

  var dataForecastList = RxList<ForecastModel>([]);
  var currentForecast = Rxn<ForecastModel>();
  var formValidation = GlobalKey<FormState>().obs;
  var isLoading = false.obs;
  var today = Rxn<DateTime>();

  var allCityList = RxList<CityModel>([]);
  var perDayForecast = <String>[].obs;
  var username = "".obs;
  var provinsi = "".obs;
  var kota = "".obs;

  var currentTimeDiv = Rxn<DaytimeDiv>();

  @override
  void onInit() async {
    super.onInit();

    await getDataForecastList();
    allCityList.bindStream(firebase.readCityData());
    today.value = DateTime.now().hour < 3
        ? DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day + 1,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second)
        : DateTime.now();

    print(DateTime.fromMillisecondsSinceEpoch(
        int.parse(dataForecastList.value.first.dt!) * 1000));
  }

  formValidator(String? value, RxString string) {
    if (value == null || value.isEmpty) {
      return "Kolom ini tidak boleh kosong";
    }
    string.value = value;
    return null;
  }

  List<Widget> dayColumnList(dayList) {
    List<Widget> dummy = [];
    for (var day in dayList) {
      dummy.add(DayGroupContainer(
        day: day,
      ));
    }
    return dummy;
  }

  List<Widget> contentListviewList(
      List<ForecastModel> contentList, dayForecastList) {
    List<Widget> dummy = [];

    for (var dayForecast in dayForecastList) {
      List<ForecastModel> dummyForecast = contentList
          .where((e) => e.dt_txt!.substring(0, 10) == dayForecast)
          .toList();

      dummy.add(ForecastContainer(
        dummyForecast: dummyForecast,
      ));
    }
    return dummy;
  }

  masukButton() async {
    if (formValidation.value.currentState!.validate()) {
      isLoading.value = true;
      try {
        await getDataForecastList();
        isLoading.value = false;
        Get.toNamed(RoutesName.show_data_page);

        currentForecast.value = dataForecastList
            .where((e) =>
                DateTime.parse(e.dt_txt!).millisecondsSinceEpoch <=
                today.value!.millisecondsSinceEpoch)
            .last;

        perDayForecast.value = dataForecastList
            .map((e) => e.dt_txt!.substring(0, 10))
            .toSet()
            .toList();
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("title", "message");
      }
    }
  }

  refreshButton() {}

  String? catchKota() {
    if (kota.value.contains("Kab.")) return kota.value.split("Kab. ").first;
    if (kota.value.contains("Kota")) return kota.value.split("Kota ").first;
  }

  getDataForecastList() async {
    try {
      try {} catch (e, s) {
        print(s);
      }
      var result = await service.getForecastList(catchKota());

      if (result != null) {
        dataForecastList.value =
            result.forecastList!.map((e) => ForecastModel.fromJson(e)).toList();
      }
      print(result);
    } catch (e) {}
  }
}

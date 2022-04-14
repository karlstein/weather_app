import 'package:get/get.dart';
import 'package:weatherapp/pages/get_data_page.dart';
import 'package:weatherapp/pages/show_data_page.dart';
import 'package:weatherapp/routes/routes_name.dart';

class PageRoutes {
  static final pages = [
    GetPage(name: RoutesName.get_data_page, page: () => GetDataPage()),
    GetPage(name: RoutesName.show_data_page, page: () => ShowDataPage()),
  ];
}

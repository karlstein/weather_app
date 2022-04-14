import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/const.dart';
import 'package:weatherapp/controllers/app_controller.dart';

class GetDataPage extends StatelessWidget {
  const GetDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(AppController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Form(
              key: c.formValidation.value,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(
                          child: Text(
                        "5 day weather forecasting",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )),
                    ),
                    TextFormField(
                      validator: (username) =>
                          c.formValidator(username, c.username),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "Masukan nama lengkap anda"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSearchBox: true,
                        showSelectedItems: true,
                        items: c.allCityList.value
                            .map((e) => e.provinsi!)
                            .toSet()
                            .toList(),
                        dropdownSearchDecoration: kFormFieldDecor.copyWith(
                            labelText: "Provinsi",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10)),
                        onChanged: (value) => c.provinsi.value = value!,
                        validator: (provinsi) =>
                            c.formValidator(provinsi, c.provinsi),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: DropdownSearch<String>(
                        enabled: c.provinsi.value != "",
                        mode: Mode.MENU,
                        showSearchBox: true,
                        showSelectedItems: true,
                        items: c.allCityList.value
                            .where((f) => f.provinsi == c.provinsi.value)
                            .map((e) => e.kota!)
                            .toList(),
                        dropdownSearchDecoration: kFormFieldDecor.copyWith(
                            labelText: "Kota",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10)),
                        onChanged: print,
                        validator: (kota) => c.formValidator(kota, c.kota),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 46,
                      width: 342,
                      child: TextButton(
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                              color: Color(0xFFE0DADA),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF5E5CE4)),
                        ),
                        onPressed: () => c.masukButton(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weatherapp/models/city_model.dart';

class FirebaseInstance {
  var cityCollection = FirebaseFirestore.instance.collection('ProvinsiKota');

  Stream<List<CityModel>> readCityData() {
    return cityCollection
        .snapshots()
        .map((query) => query.docs.map((e) => CityModel.fromJson(e)).toList());
  }
}

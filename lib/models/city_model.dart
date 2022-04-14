class CityModel {
  String? provinsi;
  String? kota;
  String? searchString;

  CityModel({this.provinsi, this.kota, this.searchString});

  CityModel.fromJson(snapshot) {
    provinsi = snapshot['provinsi'];
    kota = snapshot['kota'];
    searchString = snapshot['search_string'];
  }
}

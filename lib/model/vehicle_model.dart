class AllVehiclesModel {
  List<Data>? data;
  String? message;

  AllVehiclesModel({this.data, this.message});

  AllVehiclesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? vehicle;

  Data({this.id, this.vehicle});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicle = json['vehicle'];
  }
}

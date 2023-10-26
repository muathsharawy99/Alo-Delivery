class DeliveryOrdersModel {
  bool? success;
  List<Data>? data;
  String? message;

  DeliveryOrdersModel({this.success, this.data, this.message});

  DeliveryOrdersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
  String? from;
  String? to;
  String? phone;
  String? image;
  String? description;
  int? userId;
  int? vehicleId;
  String? status;

  Data(
      {this.id,
      this.from,
      this.to,
      this.phone,
      this.image,
      this.description,
      this.userId,
      this.vehicleId,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    phone = json['phone'];
    image = json['image'];
    description = json['description'];
    userId = json['user_id'];
    vehicleId = json['vehicle_id'];
    status = json['status'];
  }
}

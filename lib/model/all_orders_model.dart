class AllOrdersModel {
  List<Data>? data;
  String? message;
  int? status;

  AllOrdersModel({this.data, this.message, this.status});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  List<Orders>? orders;

  Data({this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }
}

class Orders {
  int? id;
  String? from;
  String? to;
  String? phone;
  String? image;
  int? vehicleId;
  String? description;
  int? clientId;

  Orders(
      {this.id,
      this.from,
      this.to,
      this.phone,
      this.image,
      this.vehicleId,
      this.description,
      this.clientId});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    phone = json['phone'];
    image = json['image'];
    vehicleId = json['vehicle_id'];
    description = json['description'];
    clientId = json['client_id'];
  }
}

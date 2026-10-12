// ignore_for_file: must_be_immutable
import 'package:alo_delivery/core/shared/models/base.dart';

class ClientOrderModel extends Model {
  late String from, to, phone, image, description;
  late int vehicleId, clientId;

  ClientOrderModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    from = stringFromJson(json, 'from');
    to = stringFromJson(json, 'to');
    phone = stringFromJson(json, 'phone');
    image = stringFromJson(json, 'image');
    description = stringFromJson(json, 'description');
    vehicleId = intFromJson(json, 'vehicle_id');
    clientId = intFromJson(json, 'client_id');
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'from': from,
    'to': to,
    'phone': phone,
    'image': image,
    'description': description,
    'vehicle_id': vehicleId,
    'client_id': clientId,
  };
}

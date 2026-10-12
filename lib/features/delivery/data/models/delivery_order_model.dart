// ignore_for_file: must_be_immutable
import 'package:alo_delivery/core/shared/models/base.dart';

class DeliveryOrderModel extends Model {
  late String from, to, phone, image, description, status;
  late int userId, vehicleId;

  DeliveryOrderModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    from = stringFromJson(json, 'from');
    to = stringFromJson(json, 'to');
    phone = stringFromJson(json, 'phone');
    image = stringFromJson(json, 'image');
    description = stringFromJson(json, 'description');
    status = stringFromJson(json, 'status');
    userId = intFromJson(json, 'user_id');
    vehicleId = intFromJson(json, 'vehicle_id');
  }

  /// The id as the API expects it (`order_id`).
  int get intId => int.tryParse(id) ?? 0;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'from': from,
    'to': to,
    'phone': phone,
    'image': image,
    'description': description,
    'status': status,
    'user_id': userId,
    'vehicle_id': vehicleId,
  };
}

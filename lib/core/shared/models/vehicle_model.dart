// ignore_for_file: must_be_immutable
import 'base.dart';

class VehicleModel extends Model {
  late String name;

  VehicleModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'vehicle');
  }

  /// The id as the API expects it (`vehicle_id`).
  int get intId => int.tryParse(id) ?? 0;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'vehicle': name};
}

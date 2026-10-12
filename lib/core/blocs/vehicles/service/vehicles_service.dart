import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';

class VehiclesService {
  Future<CustomResponse<Map<String, dynamic>>> getVehicles() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.vehicles,
      );
}

import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';

class MerchantService {
  Future<CustomResponse<Map<String, dynamic>>> createOrder(
    Map<String, dynamic> body,
  ) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.merchantCreateOrder,
    body: {'type': 'merchant', ...body},
  );
}
